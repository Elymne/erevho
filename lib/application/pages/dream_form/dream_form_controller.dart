import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/core/params.dart';
import 'package:erevho/di/tools/app_localisation_tools.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/create_one_dream_usecase.dart';
import 'package:erevho/domain/usecases/dream/get_one_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectable
class DreamFormController extends StatefulControllerWithParams<DreamFormParam> {
  final AppRouter appRouter = GetIt.instance();
  final AppLocalisationTools appLocals = GetIt.instance();
  final GetOneDreamUsecase getOneDreamUsecase;
  final CreateOneDreamUsecase createOneDreamUsecase;

  DreamFormController(this.getOneDreamUsecase, this.createOneDreamUsecase);

  late final GlobalKey<FormState> formKey;

  late final FutureProvider<DreamForm> _dreamFormProvider = FutureProvider<DreamForm>((ref) async {
    if (params?.id != null) return DreamForm.fromEntity(await getOneDreamUsecase.perform(GetOneDreamParams(params!.id!)));
    return DreamForm(title: '', content: '', tags: []);
  });
  AsyncValue<DreamForm> get dreamForm => ref.watch(_dreamFormProvider);

  final DreamForm _dreamForm = DreamForm(title: '', content: '', tags: []);

  @override
  void init(BuildContext context, WidgetRef ref, DreamFormParam params) async {
    super.init(context, ref, params);
    formKey = GlobalKey<FormState>();
  }

  void saveTitle(String? title) => _dreamForm.title = title!;
  String? validateTitle(String? text) {
    if (text == null) return appLocals.current.title_form_error;
    if (text == '') return appLocals.current.title_form_error;
    return null;
  }

  void saveContent(String? content) => _dreamForm.content = content!;
  String? validateContent(String? text) {
    if (text == null) return appLocals.current.content_form_error;
    if (text == '') return appLocals.current.content_form_error;
    return null;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await createOneDreamUsecase.perform(CreateOneDreamParams(
        title: _dreamForm.title,
        content: _dreamForm.content,
        pseudonym: 'NONE',
        dreamType: DreamEntity.normal,
        tags: _dreamForm.tags,
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data created')),
      );

      appRouter.navigate(context, personnal);
    }
  }
}

class DreamFormParam extends Params {
  final String? id;
  DreamFormParam({required this.id});
}

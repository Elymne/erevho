import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/application/providers/dream_providers.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/create_one_dream_usecase.dart';
import 'package:erevho/domain/usecases/dream/get_one_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class DreamFormController extends Controller {
  final CreateOneDreamUsecase createOneDreamUsecase;
  DreamFormController(this.createOneDreamUsecase);

  /// Global key used to manage form.
  late final GlobalKey<FormState> formKey;

  /// When updating dream, we need the current id of the dream to fetch data from DB.
  late final GetOneDreamParams? _getOneDreamParams;
  void setGetOneDreamParams(String? id) => _getOneDreamParams = id == null ? null : GetOneDreamParams(id);

  /// Provider to get teh current state of the form.
  AsyncValue<DreamForm> get initDreamForm => ref!.watch(dreamFormProvider(_getOneDreamParams));

  /// Form that we will save.
  final DreamForm _dreamFormToSave = DreamForm(title: '', content: '', tags: []);

  @override
  void init({BuildContext? context, WidgetRef? ref}) async {
    super.init(context: context, ref: ref);
    formKey = GlobalKey<FormState>();
  }

  /// Check and title store.
  void saveTitle(String? title) => _dreamFormToSave.title = title!;
  String? validateTitle(String? text) {
    if (text == null) return appLocals.current.title_form_error;
    if (text == '') return appLocals.current.title_form_error;
    return null;
  }

  /// Check and content store.
  void saveContent(String? content) => _dreamFormToSave.content = content!;
  String? validateContent(String? text) {
    if (text == null) return appLocals.current.content_form_error;
    if (text == '') return appLocals.current.content_form_error;
    return null;
  }

  /// Now, we update or create new entry to db.
  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await createOneDreamUsecase.perform(CreateOneDreamParams(
        title: _dreamFormToSave.title,
        chapters: [],
        pseudonym: 'NONE',
        dreamType: DreamEntity.normal,
        tags: _dreamFormToSave.tags,
      ));

      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(content: Text('Data created')),
      );

      appRouter.navigate(context!, personnal);
    }
  }
}

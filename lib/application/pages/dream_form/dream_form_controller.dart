import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/core/params.dart';
import 'package:erevho/domain/usecases/dream/create_one_dream_usecase.dart';
import 'package:erevho/domain/usecases/dream/get_one_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DreamFormController extends StatefulControllerWithParams<DreamFormParam> {
  final AppRouter appRouter = GetIt.instance();
  final GetOneDreamUsecase getOneDreamUsecase;
  final CreateOneDreamUsecase createOneDreamUsecase;

  // State watchers.
  late final FutureProvider<DreamForm> _dreamFormProvider;
  AsyncValue<DreamForm> get dreams => ref.watch(_dreamFormProvider);

  DreamFormController(this.getOneDreamUsecase, this.createOneDreamUsecase);

  @override
  void init(BuildContext context, WidgetRef ref, DreamFormParam params) async {
    super.init(context, ref, params);
    _dreamFormProvider = FutureProvider<DreamForm>((ref) async {
      // Update Mode.
      if (params.id != null) {
        final dream = await getOneDreamUsecase.perform(GetOneDreamParams(params.id!));
        return DreamForm(title: dream.title, content: dream.content, tags: dream.tags.map((e) => e.title).toList());
      }
      // Create mod.
      return DreamForm(title: '', content: '', tags: []);
    });
  }

  void backAction() {}
}

class DreamFormParam extends Params {
  final String? id;
  DreamFormParam({required this.id});
}

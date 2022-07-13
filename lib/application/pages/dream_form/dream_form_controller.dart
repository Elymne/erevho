import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/dream_form/dream_form.dart';
import 'package:erevho/application/providers/dream_providers.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/create_one_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class DreamFormController extends Controller {
  final CreateOneDreamUsecase createOneDreamUsecase;
  DreamFormController(this.createOneDreamUsecase);

  /// Global key used to manage form.
  late final GlobalKey<FormState> formKey;

  /// Provider to get the current state of the form at view launch.
  AsyncValue<DreamForm> getDreamFormValue(String? id) => ref!.watch(dreamFormFutureProvider(id));

  /// Object that contain values from form that we will use later to store/update data in DB.
  final DreamForm _dreamFormToSave = DreamForm(title: '', content: '', tags: []);

  @override
  void init({BuildContext? context, WidgetRef? ref}) async {
    super.init(context: context, ref: ref);
    formKey = GlobalKey<FormState>();
  }

  /// Title checker and setter.
  void saveTitle(String? title) => _dreamFormToSave.title = title!;
  String? validateTitle(String? text) {
    if (text == null) return alt.current.title_form_error;
    if (text == '') return alt.current.title_form_error;
    return null;
  }

  /// Content checker and setter.
  void saveContent(String? content) => _dreamFormToSave.content = content!;
  String? validateContent(String? text) {
    if (text == null) return alt.current.chapter_content_form_error;
    if (text == '') return alt.current.chapter_content_form_error;
    return null;
  }

  /// Called when user want to submit his changes/creation.
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

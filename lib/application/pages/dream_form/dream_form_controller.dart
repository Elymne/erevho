import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/dream_form/forms/dream_form.dart';
import 'package:erevho/application/pages/dream_form/providers/dream_form_state_provider.dart';
import 'package:erevho/application/pages/dream_form/providers/load_dream_form_future_provider.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/usecases/dream/create_one_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class DreamFormController extends Controller {
  final CreateOneDreamUsecase createOneDreamUsecase;
  DreamFormController(this.createOneDreamUsecase);

  /// Provider that will create my form data for my view. I use it just one time.
  /// Don't refresh it or it will erase the other provider for FormData state.
  AsyncValue<DreamForm> loadFormValue(String? id) => ref!.watch(loadFormFutureProvider(id));

  /// Global key used to manage form.
  late final GlobalKey<FormState> formKey;

  /// Get the current state of dream form as it will be updated constantly.
  DreamForm get dreamFormValue => ref!.watch(dreamFormStateProvider) as DreamForm;

  @override
  void init({BuildContext? context, WidgetRef? ref}) async {
    super.init(context: context, ref: ref);
    formKey = GlobalKey<FormState>();
  }

  /// Used when form is loaded. We set the current value to our form state manager.
  void setDreamFormValue(DreamForm dreamForm) {
    ref!.read(dreamFormStateProvider.notifier).state = dreamForm;
  }

  /// Title checker and setter.
  void saveTitle(String? title) => ref!.read(dreamFormStateProvider.notifier).state!.title = title ?? '';
  String? validateTitle(String? text) {
    if (text == null) return alt.current.title_form_error;
    if (text == '') return alt.current.title_form_error;
    return null;
  }

  /// Called when user want to submit his changes/creation.
  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(content: Text('Data created')),
      );
      appRouter.navigate(context!, home);
    }
  }
}

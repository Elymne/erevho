import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/usecases/dream/create_one_dream.usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DreamFormController extends Controller {
  final CreateOneDream createOneDreamUsecase;
  String? id;

  DreamFormController(super.ref, this.createOneDreamUsecase);

  /// Manage the current form. When no id is send from the route, then we create a new form.
  /// If we have an id given to controller, then it's a modification.
  FutureProvider get dreamForm {
    return FutureProvider((_) {
      if (id != null) {
        return null;
      }
      //final dream = ref.watch(getOneDreamUsecaseProvider).perform(GetOneDreamParams(id!));
    });
  }

  void init({String? id}) {
    this.id = id;
  }
}

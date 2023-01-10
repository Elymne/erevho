import 'package:erevho/core/controller.dart';
import 'package:erevho/features/dreams/domain/usecases/dream/get_all_dreams.usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personnalControllerProvider = Provider((ref) => PersonnalController(ref));

class PersonnalController extends Controller {
  PersonnalController(super.ref);

  void filterDreams(String title) {
    ref.refresh(getAllDreamsProvider(GetAllDreamsParams(title: title)));
  }
}

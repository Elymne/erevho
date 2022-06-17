import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersonnalController extends StatefulController {
  final GetAllDreamsUsecase getAllDreamsUsecase;

  // State watchers.
  late final _dreamsProvider = FutureProvider<List<DreamEntity>>((ref) async {
    print(textfieldValue);
    return await getAllDreamsUsecase.perform(GetAllDreamsParams());
  });
  AsyncValue<List<DreamEntity>> get dreams => ref.watch(_dreamsProvider);

  // Private state TextField.
  String textfieldValue = '';

  PersonnalController(this.getAllDreamsUsecase);

  void onSubmitted(String text) {
    textfieldValue = text;
    ref.refresh(_dreamsProvider);
  }
}

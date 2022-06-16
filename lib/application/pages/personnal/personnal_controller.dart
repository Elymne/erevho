import 'package:erevho/core/controller.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersonnalController extends StatefulController {
  final GetAllDreamsUsecase getAllDreamsUsecase;

  // State watchers.
  late final _dreamsProvider = FutureProvider<List<DreamModel>>((ref) async {
    return getAllDreamsUsecase.perform(GetAllDreamsParams()) as List<DreamModel>;
  });
  get dreams => ref.watch(_dreamsProvider);

  PersonnalController(this.getAllDreamsUsecase);
}

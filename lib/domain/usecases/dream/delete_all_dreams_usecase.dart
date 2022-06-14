import 'package:erevho/core/usecase/params.dart';
import 'package:erevho/core/usecase/usecase.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase to delete a list of Dreams created by user.
/// Possibility to delete multiple dreams in one hit.
/// ex: user just click to the trash icon from dream list and validate his selection.
/// ex: user delete a dream from the detailed dream.
@Injectable()
class DeleteAllDreamsUsecase extends Usecase<int, DeleteAllDreamsParams> {
  final DreamLocalRepository dreamLocalRepository;

  DeleteAllDreamsUsecase(this.dreamLocalRepository);

  @override
  Future<int> perform(DeleteAllDreamsParams params) async {
    try {
      dreamLocalRepository.deleteAll(params.ids);
      return params.ids.length;
    } catch (e) {
      throw ('Errro: $e');
    }
  }
}

class DeleteAllDreamsParams extends Params {
  final List<String> ids;
  DeleteAllDreamsParams(this.ids);
}

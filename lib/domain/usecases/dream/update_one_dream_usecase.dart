import 'package:erevho/core/usecase/params.dart';
import 'package:erevho/core/usecase/usecase.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase when user update his own dream.
@Injectable()
class UpdateOneDreamUsecase extends Usecase<void, UpdateOneDreamParams> {
  final DreamLocalRepository dreamLocalRepository;

  UpdateOneDreamUsecase(this.dreamLocalRepository);

  @override
  Future perform(UpdateOneDreamParams params) async {
    try {
      dreamLocalRepository.updateOne(params.dreamEntity);
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

class UpdateOneDreamParams extends Params {
  final DreamEntity dreamEntity;
  UpdateOneDreamParams(this.dreamEntity);
}

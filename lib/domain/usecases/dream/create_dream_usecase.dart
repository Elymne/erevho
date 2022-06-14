import 'package:erevho/core/usecase/params.dart';
import 'package:erevho/core/usecase/usecase.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase to create a dream.
/// ex: User has completed his form and validate it.
@Injectable()
class CreateDreamUsecase extends Usecase<int, CreateDreamParams> {
  final DreamLocalRepository dreamLocalRepository;

  CreateDreamUsecase(this.dreamLocalRepository);

  @override
  Future<int> perform(CreateDreamParams params) async {
    try {
      return await dreamLocalRepository.createOne(params.dreamEntity);
    } catch (e) {
      throw ("ERROR DreamLocalRepository: $e");
    }
  }
}

/// Params that take data taht structure an entity dream.
class CreateDreamParams extends Params {
  final DreamEntity dreamEntity;
  CreateDreamParams(this.dreamEntity);
}

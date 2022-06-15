import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase to get a detailed dream when user want to access to read one.
/// ex: user click on a dream from list to access to detailed page.
@Injectable()
class GetOneDreamUsecase extends Usecase<DreamEntity, GetOneDreamParams> {
  final DreamLocalRepository dreamLocalRepository;
  GetOneDreamUsecase(this.dreamLocalRepository);

  @override
  Future<DreamEntity> perform(GetOneDreamParams params) async {
    try {
      return dreamLocalRepository.getOne(params.id);
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

class GetOneDreamParams extends Params {
  final String id;
  GetOneDreamParams(this.id);
}

import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase to get all dreams created by user. Allow possibility to filter theses dreams.
/// ex: User accessing to his global list of created dreams.
/// ex: User filtering his dreams by tag.
@Injectable()
class GetAllDreamsUsecase extends Usecase<List<DreamEntity>, GetAllDreamsParams> {
  final DreamLocalRepository dreamLocalRepository;

  GetAllDreamsUsecase(this.dreamLocalRepository);

  @override
  Future<List<DreamEntity>> perform(GetAllDreamsParams params) async {
    try {
      return dreamLocalRepository.getAll();
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

/// Penser à faire un filtrage plus tard, enfin plutôt à l'appliquer sur le usecase ne haut là.
class GetAllDreamsParams extends Params {
  final String? title;
  final String? pseudonym;
  final List<String>? tagTitles;
  final DateTime? created;
  GetAllDreamsParams({this.title, this.pseudonym, this.tagTitles, this.created});
}

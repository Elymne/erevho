import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase to get all dreams created by user. Allow possibility to filter theses dreams.
/// ex: User accessing to his global list of created dreams.
/// ex: User filtering his dreams by tag.
/// TODO Meilleur gestion de filtrage à faire de toute évidence.
@Injectable()
class GetAllDreamsUsecase extends Usecase<List<DreamEntity>, GetAllDreamsParams> {
  final DreamLocalRepository dreamLocalRepository;

  GetAllDreamsUsecase(this.dreamLocalRepository);

  @override
  Future<List<DreamEntity>> perform(GetAllDreamsParams params) async {
    try {
      final dreams = await dreamLocalRepository.getAll();
      return dreams.where((dream) {
        if (dream.title == params.title) return true;
        if (dream.pseudonym == params.pseudonym) return true;
        if (params.tagTitles != null) {
          if (dream.tags.map((tag) => tag.title).toSet().intersection(params.tagTitles!.toSet()).isNotEmpty) return true;
        }
        return false;
      }).toList();
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

  // TODO Mouai bof, à voir.
  final DateTime? created;
  GetAllDreamsParams({this.title, this.pseudonym, this.tagTitles, this.created});
}

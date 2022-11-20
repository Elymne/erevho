import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllDreamsProvider = FutureProvider.autoDispose.family<List<DreamEntity>, GetAllDreamsParams>((ref, arg) async {
  final usecase = GetAllDreamsUsecase(ref.read(dreamLocalRepositoryProvider));
  return usecase.perform(arg);
});

/// Usecase to get all dreams created by user. Allow possibility to filter theses dreams.
/// ex: User accessing to his global list of created dreams.
/// ex: User filtering his dreams by tag.
class GetAllDreamsUsecase extends Usecase<List<DreamEntity>, GetAllDreamsParams> {
  final DreamLocalRepository dreamLocalRepository;

  GetAllDreamsUsecase(this.dreamLocalRepository);

  @override
  Future<List<DreamEntity>> perform(GetAllDreamsParams params) async {
    try {
      final dreams = await dreamLocalRepository.getAll();
      // * No filters, no filtering
      if (params.hasNoFilter) return dreams;

      // * Procede to filtering.
      return dreams.where((dream) {
        if (dream.title == params.title) return true;
        if (dream.pseudonym == params.pseudonym) return true;
        if (params.tagTitles != null) {
          // * check for each of our tags, if one of them exists in the current dream.
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
  final DateTime? created;

  const GetAllDreamsParams({this.title, this.pseudonym, this.tagTitles, this.created});

  bool get hasNoFilter => title == null && pseudonym == null && tagTitles == null;
}

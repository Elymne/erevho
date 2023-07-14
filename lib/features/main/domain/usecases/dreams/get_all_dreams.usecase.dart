import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllDreamsProvider = FutureProvider.autoDispose.family<List<Dream>, GetAllDreamsParams>((ref, arg) async {
  final usecase = GetAllDreams(ref.read(dreamLocalRepositoryProvider));
  return usecase.perform(arg);
});

/// Usecase to get all dreams created by user. Allow possibility to filter theses dreams.
/// ex: User accessing to his global list of created dreams.
/// ex: User filtering his dreams by tag.
class GetAllDreams extends Usecase<List<Dream>, GetAllDreamsParams> {
  final DreamLocalRepository dreamLocalRepository;

  GetAllDreams(this.dreamLocalRepository);

  @override
  Future<List<Dream>> perform(GetAllDreamsParams params) async {
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
          if (dream.tags.map((tag) => tag).toSet().intersection(params.tagTitles!.toSet()).isNotEmpty) return true;
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

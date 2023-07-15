import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateOneDreamProvider = FutureProvider.autoDispose.family<void, UpdateOneDreamParams>((ref, arg) {
  final usecase = UpdateOneDream(ref.read(dreamLocalRepositoryProvider));
  return usecase.perform(arg);
});

/// Usecase when user update his own dream.
class UpdateOneDream extends Usecase<void, UpdateOneDreamParams> {
  final DreamLocalRepository dreamLocalRepository;

  UpdateOneDream(this.dreamLocalRepository);

  @override
  Future perform(UpdateOneDreamParams params) async {
    try {
      dreamLocalRepository.putOne(params.createDreamEntity());
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

/// TODO Boilerplate here.
class UpdateOneDreamParams extends Params {
  final String id;
  final String title;
  final String content;
  final String pseudonym;
  final int dreamType;
  final List<String> tags;

  const UpdateOneDreamParams({required this.id, required this.title, required this.content, required this.pseudonym, required this.dreamType, required this.tags});

  /// That's what we'll use in our usecase.
  Dream createDreamEntity() {
    final result = Dream(
      uuid: id,
      title: title,
      content: content,
      pseudonym: pseudonym,
      tags: tags,
      created: DateTime.now(),
      updated: DateTime.now(),
    );
    return result;
  }
}

import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/repositories/local/dream_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

// TODO to be defined.
final createOneDreamProvider = FutureProvider.autoDispose.family<int, CreateOneDreamParams>((ref, arg) {
  final usecase = CreateOneDream(ref.read(dreamLocalRepositoryProvider));
  return usecase.perform(arg);
});

/// Usecase to create a dream.
/// ex: User has completed his form and validate it.
class CreateOneDream extends Usecase<int, CreateOneDreamParams> {
  final DreamLocalRepository dreamLocalRepository;

  CreateOneDream(this.dreamLocalRepository);

  @override
  Future<int> perform(CreateOneDreamParams params) async {
    try {
      return await dreamLocalRepository.putOne(params.createDreamEntity());
    } catch (e) {
      throw ("ERROR DreamLocalRepository: $e");
    }
  }
}

/// TODO Boilerplate here.
class CreateOneDreamParams extends Params {
  final String title;
  final String content;
  final String pseudonym;
  final int dreamType;
  final List<String> tags;

  CreateOneDreamParams({required this.title, required this.content, required this.pseudonym, required this.dreamType, required this.tags});

  /// That's what we'll use in our usecase.
  Dream createDreamEntity() {
    final result = Dream(
      uuid: const Uuid().v4(),
      title: title,
      content: content,
      pseudonym: pseudonym,
      userUuid: pseudonym,
      tags: tags,
      created: DateTime.now(),
      updated: DateTime.now(),
    );
    return result;
  }
}

import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/data/models/dream/chapter_model.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:erevho/data/models/dream/tag_model.dart';
import 'package:erevho/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/domain/entities/dream/chapter.entity.dart';
import 'package:erevho/domain/entities/dream/tag.entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
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
      return await dreamLocalRepository.createOne(params.createDreamEntity());
    } catch (e) {
      throw ("ERROR DreamLocalRepository: $e");
    }
  }
}

/// TODO Boilerplate here.
class CreateOneDreamParams extends Params {
  final String title;
  final List<Chapter> chapters;
  final String pseudonym;
  final int dreamType;
  final List<String> tags;

  CreateOneDreamParams({required this.title, required this.chapters, required this.pseudonym, required this.dreamType, required this.tags});

  /// That's what we'll use in our usecase.
  DreamModel createDreamEntity() {
    final result = DreamModel(
      id: const Uuid().v4(),
      title: title,
      chapters: chapters as List<ChapterModel>,
      pseudonym: pseudonym,
      dreamType: dreamType,
      tags: _createTags(),
      created: DateTime.now(),
    );
    return result;
  }

  /// Generate tag color depending of wording.
  /// For example, if your tag is nsfw, red color is automatically setted to be red.
  List<TagModel> _createTags() {
    return tags.map<TagModel>((tag) {
      if (tag == 'nsfw') return TagModel(id: '', title: tag, tagColor: TagColor.red);
      return TagModel(id: '', title: tag, tagColor: TagColor.blue);
    }).toList();
  }
}

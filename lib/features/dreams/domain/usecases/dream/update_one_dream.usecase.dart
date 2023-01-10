import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/dreams/data/models/dream/chapter_model.dart';
import 'package:erevho/features/dreams/data/models/dream/dream_model.dart';
import 'package:erevho/features/dreams/data/models/dream/tag_model.dart';
import 'package:erevho/features/dreams/data/repositories/local/dream_local_repository_impl.dart';
import 'package:erevho/features/dreams/domain/entities/dream/tag.entity.dart';
import 'package:erevho/features/dreams/domain/repositories/local/dream_local_repository.dart';
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
      dreamLocalRepository.updateOne(params.createDreamEntity());
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

/// TODO Boilerplate here.
class UpdateOneDreamParams extends Params {
  final String id;
  final String title;
  final String chapters;
  final String pseudonym;
  final int dreamType;
  final List<String> tags;

  const UpdateOneDreamParams({required this.id, required this.title, required this.chapters, required this.pseudonym, required this.dreamType, required this.tags});

  /// That's what we'll use in our usecase.
  DreamModel createDreamEntity() {
    final result = DreamModel(
      id: id,
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

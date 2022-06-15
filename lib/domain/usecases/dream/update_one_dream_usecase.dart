import 'package:erevho/core/params.dart';
import 'package:erevho/core/usecase.dart';
import 'package:erevho/data/models/dream/dream_model.dart';
import 'package:erevho/data/models/dream/tag_model.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';
import 'package:erevho/domain/repositories/local/dream_local_repository.dart';
import 'package:injectable/injectable.dart';

/// Usecase when user update his own dream.
@Injectable()
class UpdateOneDreamUsecase extends Usecase<void, UpdateOneDreamParams> {
  final DreamLocalRepository dreamLocalRepository;

  UpdateOneDreamUsecase(this.dreamLocalRepository);

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
  final String content;
  final String pseudonym;
  final DreamType dreamType;
  final List<String> tags;

  UpdateOneDreamParams({required this.id, required this.title, required this.content, required this.pseudonym, required this.dreamType, required this.tags});

  /// That's what we'll use in our usecase.
  DreamModel createDreamEntity() {
    final result = DreamModel(
      id: id,
      title: title,
      content: content,
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

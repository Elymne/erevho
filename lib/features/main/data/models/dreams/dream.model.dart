import 'package:erevho/features/main/data/models/dreams/chapter.model.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DreamModel {
  int id = 0;

  @Unique()
  final String uuid;

  final String pseudonym;

  final String userUuid;

  final String title;

  final ToMany<ChapterModel> chapters = ToMany<ChapterModel>();

  final List<String> tags;

  @Property(type: PropertyType.date)
  final DateTime created;

  @Property(type: PropertyType.date)
  final DateTime updated;

  DreamModel(this.uuid, this.pseudonym, this.userUuid, this.title, this.tags, this.created, this.updated);

  DreamModel.fromEntity({
    int? id,
    required Dream dream,
    List<ChapterModel>? chapters,
  })  : id = id ?? 0,
        uuid = dream.uuid,
        pseudonym = dream.pseudonym,
        userUuid = dream.userUuid,
        title = dream.title,
        tags = dream.tags,
        created = dream.created,
        updated = dream.updated {
    if (chapters != null) this.chapters.addAll(chapters);
  }

  Dream toEntity() {
    return Dream(
      uuid: uuid,
      title: title,
      pseudonym: pseudonym,
      chapters: chapters.map((element) => element.toEntity()).toList(),
      tags: tags,
      userUuid: userUuid,
      created: created,
      updated: updated,
    );
  }
}

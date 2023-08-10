import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
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

  final List<String> tags;

  @Property(type: PropertyType.date)
  final DateTime created;

  @Property(type: PropertyType.date)
  final DateTime updated;

  DreamModel(this.uuid, this.pseudonym, this.userUuid, this.title, this.tags, this.created, this.updated);

  DreamModel.fromEntity({int? id, required Dream dream})
      : id = id ?? 0,
        uuid = dream.uuid,
        pseudonym = dream.pseudonym,
        userUuid = dream.userUuid,
        title = dream.title,
        tags = dream.tags,
        created = dream.created,
        updated = dream.updated;

  Dream toEntity({List<Chapter>? chapters}) {
    return Dream(
      uuid: uuid,
      title: title,
      pseudonym: pseudonym,
      chapters: chapters ?? [],
      tags: tags,
      userUuid: userUuid,
      created: created,
      updated: updated,
    );
  }
}

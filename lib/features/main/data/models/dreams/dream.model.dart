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

  final String content;

  final List<String> tags;

  @Property(type: PropertyType.date)
  final DateTime created;

  @Property(type: PropertyType.date)
  final DateTime updated;

  DreamModel(this.uuid, this.pseudonym, this.userUuid, this.title, this.content, this.tags, this.created, this.updated);

  DreamModel.fromEntity(Dream dream)
      : uuid = dream.uuid,
        pseudonym = dream.pseudonym,
        userUuid = dream.userUuid,
        title = dream.title,
        content = dream.content,
        tags = dream.tags,
        created = dream.created,
        updated = dream.updated;

  Dream toEntity() {
    return Dream(
      uuid: uuid,
      content: content,
      created: created,
      pseudonym: pseudonym,
      userUuid: userUuid,
      tags: tags,
      title: title,
      updated: updated,
    );
  }
}

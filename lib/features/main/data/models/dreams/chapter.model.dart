import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ChapterModel {
  int id = 0;

  @Unique()
  final String uuid;

  final int number;

  final String title;

  final String content;

  @Property(type: PropertyType.date)
  final DateTime created;

  @Property(type: PropertyType.date)
  final DateTime updated;

  ChapterModel(this.uuid, this.number, this.title, this.content, this.created, this.updated);

  ChapterModel.fromEntity(Chapter chapter, int? id)
      : id = id ?? 0,
        number = chapter.number,
        uuid = chapter.uuid,
        title = chapter.title,
        content = chapter.content,
        created = chapter.created,
        updated = chapter.updated;

  Chapter toEntity() {
    return Chapter(
      uuid: uuid,
      number: number,
      title: title,
      content: content,
      created: created,
      updated: updated,
    );
  }
}

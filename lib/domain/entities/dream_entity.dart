import 'package:erevho/domain/entities/tag_entity.dart';

///
abstract class DreamEntity {
  final String id;
  final String pseudonym;
  final String title;
  final List<TagEntity> tags;
  final List<String> images;
  final DateTime created;
  final DateTime updated;

  DreamEntity(this.id, this.pseudonym, this.title, this.tags, this.images, this.created, this.updated);
}

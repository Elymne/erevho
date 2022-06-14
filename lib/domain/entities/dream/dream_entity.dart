import 'package:erevho/core/data/entity.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';

/// Entity class that represente Dream post.
/// Abstraction to respect Clean Architecture.
abstract class DreamEntity extends Entity {
  final String pseudonym;
  final String title;
  final List<TagEntity> tags;
  final List<String> images;
  final DateTime created;
  final DateTime updated;

  DreamEntity({
    required String id,
    required this.pseudonym,
    required this.title,
    required this.tags,
    required this.images,
    required this.created,
    required this.updated,
  }) : super(id: id);
}

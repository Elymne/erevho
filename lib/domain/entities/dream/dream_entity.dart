import 'package:erevho/core/data/entity.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';

/// Entity class that represente Dream post.
/// Abstraction to respect Clean Architecture.
abstract class DreamEntity extends Entity {
  final String pseudonym;
  final String title;
  final String content;
  final DreamType dreamType;
  final List<TagEntity> tags;
  final DateTime created;
  final DateTime? updated;

  DreamEntity({
    required String id,
    required this.dreamType,
    required this.pseudonym,
    required this.title,
    required this.content,
    required this.tags,
    required this.created,
    this.updated,
  }) : super(id: id);
}

/// Just use that to define a style for type of dream.
enum DreamType { todo }

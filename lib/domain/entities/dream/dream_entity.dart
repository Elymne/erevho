import 'package:erevho/core/data/hive/entity.dart';
import 'package:erevho/domain/entities/dream/chapter_entity.dart';
import 'package:erevho/domain/entities/dream/tag_entity.dart';

/// Entity class that represente Dream post.
/// Abstraction to respect Clean Architecture.
abstract class DreamEntity extends Entity {
  final String pseudonym;
  final String title;
  final List<ChapterEntity> chapters;
  final int dreamType;
  final List<TagEntity> tags;
  final DateTime created;
  final DateTime? updated;

  DreamEntity({
    required String id,
    required this.dreamType,
    required this.pseudonym,
    required this.title,
    required this.chapters,
    required this.tags,
    required this.created,
    this.updated,
  }) : super(id: id);

  /// Corresponding to type of dream.
  /// Each type will has his own design on app (color theme, animated image background, etc).
  static const normal = 1;
  static const horror = 2;
}

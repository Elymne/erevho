import 'package:erevho/core/data/hive/entity.dart';
import 'package:erevho/domain/entities/dream/chapter.entity.dart';
import 'package:erevho/domain/entities/dream/tag.entity.dart';

/// Entity class that represente Dream post.
/// Abstraction to respect Clean Architecture.
abstract class Dream extends Entity {
  final String pseudonym;
  final String title;
  final List<Chapter> chapters;
  final int dreamType;
  final List<Tag> tags;
  final DateTime created;
  final DateTime? updated;

  Dream({
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

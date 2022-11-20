import 'package:erevho/core/data/hive/entity.dart';

/// One chapter of a dream.
abstract class ChapterEntity extends Entity {
  final String title;
  final int number;
  final String content;

  ChapterEntity({required super.id, required this.title, required this.number, required this.content});
}

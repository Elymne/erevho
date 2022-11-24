import 'package:erevho/core/data/hive/entity.dart';

/// One chapter of a dream.
abstract class Chapter extends Entity {
  final String title;
  final int number;
  final String content;

  Chapter({required super.id, required this.title, required this.number, required this.content});
}

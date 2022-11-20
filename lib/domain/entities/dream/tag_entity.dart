import 'package:erevho/core/data/hive/entity.dart';

/// Entity class that represente Tags associated to DreamEntity class.
/// Abstraction to respect Clean Architecture.
abstract class TagEntity extends Entity {
  final String title;
  final TagColor tagColor;

  TagEntity({required String id, required this.title, required this.tagColor}) : super(id: id);
}

/// Enum that will allow us to define colors to our custom tags.
enum TagColor { blue, green, orange, red }

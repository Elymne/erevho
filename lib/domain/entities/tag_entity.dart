/// Entity class that represente Tags associated to DreamEntity class.
/// Abstraction to respect Clean Architecture.s
abstract class TagEntity {
  final String id;
  final String title;
  final TagColor tagColor;

  TagEntity({required this.id, required this.title, required this.tagColor});
}

/// Enum that will allow us to define colors to our custom tags.
enum TagColor { black, white, blue, red }

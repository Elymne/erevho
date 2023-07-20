import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.entity.freezed.dart';
part 'chapter.entity.g.dart';

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    required String uuid,
    required String? title,
    required String content,
    required DateTime created,
    required DateTime updated,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, Object?> json) => _$ChapterFromJson(json);
}

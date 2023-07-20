import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dream.entity.freezed.dart';
part 'dream.entity.g.dart';

@freezed
class Dream with _$Dream {
  const factory Dream({
    required String uuid,
    required String pseudonym,
    required String userUuid,
    required String title,
    required List<Chapter> chapters,
    required List<String> tags,
    required DateTime created,
    required DateTime updated,
  }) = _Dream;

  factory Dream.fromJson(Map<String, Object?> json) => _$DreamFromJson(json);
}

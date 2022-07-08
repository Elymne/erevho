import 'package:erevho/core/data/hive_id.dart';
import 'package:erevho/domain/entities/dream/chapter_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
class ChapterModel extends ChapterEntity with _$ChapterModel {
  @HiveType(typeId: chapterId, adapterName: 'ChapterModelAdapter')
  const factory ChapterModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required int number,
    @HiveField(3) required String content,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, Object?> json) => _$ChapterModelFromJson(json);
}

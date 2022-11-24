import 'package:erevho/core/data/hive/hive_id.dart';
import 'package:erevho/domain/entities/dream/tag.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
class TagModel extends Tag with _$TagModel {
  @HiveType(typeId: tagId, adapterName: 'TagModelAdapter')
  const factory TagModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required TagColor tagColor,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, Object?> json) => _$TagModelFromJson(json);
}

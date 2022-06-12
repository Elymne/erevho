import 'package:erevho/core/constants/hive_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  @HiveType(typeId: tagId, adapterName: 'TagAdapter')
  const factory Tag({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required TagColor tagColor,
  }) = _Tag;

  factory Tag.fromJson(Map<String, Object?> json) => _$TagFromJson(json);
}

enum TagColor { black, white, blue, red }

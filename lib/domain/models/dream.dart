import 'package:erevho/core/constants/hive_id.dart';
import 'package:erevho/domain/models/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'dream.freezed.dart';
part 'dream.g.dart';

@freezed
class Dream with _$Dream {
  @HiveType(typeId: dreamId, adapterName: 'DreamAdapter')
  const factory Dream({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required String id,
    @HiveField(1) required String pseudonym,
    @HiveField(2) required String title,
    @HiveField(3) required List<Tag> tags,
  }) = _Dream;

  factory Dream.fromJson(Map<String, Object?> json) => _$DreamFromJson(json);
}

import 'package:erevho/core/data/hive_id.dart';
import 'package:erevho/data/models/dream/tag_model.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'dream_model.freezed.dart';
part 'dream_model.g.dart';

@freezed
class DreamModel extends DreamEntity with _$DreamModel {
  @HiveType(typeId: dreamId, adapterName: 'DreamModelAdapter')
  const factory DreamModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required String id,
    @HiveField(1) required String pseudonym,
    @HiveField(2) required String title,
    @HiveField(3) required String content,
    @HiveField(4) required int dreamType,
    @HiveField(5) required List<TagModel> tags,
    @HiveField(6) required DateTime created,
    @HiveField(7) DateTime? updated,
  }) = _DreamModel;

  factory DreamModel.fromJson(Map<String, Object?> json) => _$DreamModelFromJson(json);
}

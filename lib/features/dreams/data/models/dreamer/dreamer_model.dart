import 'package:erevho/core/data/hive/hive_id.dart';
import 'package:erevho/features/dreams/domain/entities/dreamer/dreamer.entity.dart';
import 'package:erevho/features/dreams/domain/entities/dreamer/enums/animal_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'dreamer_model.freezed.dart';
part 'dreamer_model.g.dart';

@freezed
class DreamerModel extends Dreamer with _$DreamerModel {
  @HiveType(typeId: dreamerid, adapterName: 'DreamerModelAdapter')
  const factory DreamerModel({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) @HiveField(0) required String id,
    @HiveField(1) required String pseudonym,
    @HiveField(2) required AnimalEnum animal,
  }) = _DreamerModel;

  factory DreamerModel.fromJson(Map<String, Object?> json) => _$DreamerModelFromJson(json);
}

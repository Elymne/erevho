import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'dreamer.entity.freezed.dart';
part 'dreamer.entity.g.dart';

@freezed
class UserParams with _$UserParams {
  @Entity(realClass: UserParams)
  const factory UserParams({
    @Id(assignable: true) required int id,
    @Unique() required String uuid,
    required String pseudonym,
  }) = _UserParams;

  factory UserParams.fromJson(Map<String, Object?> json) => _$UserParamsFromJson(json);
}

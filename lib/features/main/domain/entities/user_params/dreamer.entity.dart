import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'dreamer.entity.freezed.dart';

@freezed
class UserParams with _$UserParams {
  @Entity(realClass: UserParams)
  const factory UserParams({
    @Id(assignable: true) required int id,
    @Unique() required int uid,
    required String pseudonym,
  }) = _UserParams;
}

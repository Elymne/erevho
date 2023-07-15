import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.entity.freezed.dart';
part 'user_data.entity.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String uuid,
    required String pseudonym,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) => _$UserDataFromJson(json);
}

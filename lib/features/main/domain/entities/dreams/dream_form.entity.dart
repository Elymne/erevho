import 'package:freezed_annotation/freezed_annotation.dart';

part 'dream_form.entity.freezed.dart';
part 'dream_form.entity.g.dart';

@freezed
class DreamForm with _$DreamForm {
  const factory DreamForm({
    required String title,
    required String chapters,
  }) = _DreamForm;

  factory DreamForm.fromJson(Map<String, Object?> json) => _$DreamFormFromJson(json);
}

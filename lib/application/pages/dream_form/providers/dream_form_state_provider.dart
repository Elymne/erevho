import 'package:erevho/application/pages/dream_form/forms/dream_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Default dreamForm provider.
/// Always non initialized.
final dreamFormStateProvider = StateProvider.autoDispose<DreamForm?>((ref) => null);

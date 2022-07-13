import 'package:erevho/application/pages/personnal/providers/dreams_future_provider.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class PersonnalController extends Controller {
  /// Get dreams from [dreamsProvider].
  AsyncValue<List<DreamEntity>> getDreamsValue() => ref!.watch(dreamsFutureProvider(null));

  /// Used when user valid his search in textform.
  void onSubmitted(String text) {
    ref!.refresh(dreamsFutureProvider(text));
  }
}

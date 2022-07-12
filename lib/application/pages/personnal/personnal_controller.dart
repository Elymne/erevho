import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/providers/dream_providers.dart';
import 'package:erevho/core/controller.dart';
import 'package:erevho/domain/entities/dream/dream_entity.dart';
import 'package:erevho/domain/usecases/dream/get_all_dreams_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class PersonnalController extends Controller {
  /// Get dreams from [dreamsProvider].
  AsyncValue<List<DreamEntity>> get dreams => ref!.watch(dreamsFutureProvider(GetAllDreamsParams()));

  /// Used when user valid his search in textform.
  void onSubmitted(String text) {
    ref!.refresh(dreamsFutureProvider(GetAllDreamsParams(title: text)));
  }
}

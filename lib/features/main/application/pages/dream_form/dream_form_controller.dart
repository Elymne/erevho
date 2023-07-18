import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/usecases/dreams/add_new_dream_usecase.dart';
import 'package:erevho/features/main/domain/usecases/dreams/get_one_dream_by_uuid_usecase.dart';
import 'package:erevho/features/main/domain/usecases/dreams/update_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamFormControllerProvider = Provider((ref) => DreamFormController(ref));

class DreamFormController extends Controller {
  late final AddNewDreamUsecase addNewDreamUsecase = ref.read(addNewDreamUsecaseProvider);
  late final GetOneDreamByUuidUsecase getOneDreamByUuidUsecase = ref.read(getOneDreamByUuidUsecaseProvider);
  late final UpdateDreamUsecase updateDreamUsecase = ref.read(updateDreamUsecaseProvider);

  final dreamProvider = StateProvider<Dream?>((ref) => null);

  DreamFormController(super.ref);

  Future init(BuildContext context, {String? newTitle, String? dreamUuid}) async {
    if (newTitle == null && dreamUuid == null) {
      if (context.mounted) {
        return Navigator.pop(context);
      }
    }
    if (newTitle != null) {
      try {
        ref.read(dreamProvider.notifier).state = await addNewDreamUsecase.perform(AddNewDreamUsecaseParams(newTitle));
        return;
      } catch (e) {
        if (context.mounted) {
          return Navigator.pop(context);
        }
      }
    }
    if (dreamUuid != null) {
      try {
        ref.read(dreamProvider.notifier).state = await getOneDreamByUuidUsecase.perform(GetOneDreamByUuidUsecaseParams(dreamUuid));
        return;
      } catch (e) {
        if (context.mounted) {
          return Navigator.pop(context);
        }
      }
    }
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}

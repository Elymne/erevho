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
  final isDreamUpdatedProvider = StateProvider<bool>((ref) => false);

  final PageController pageController = PageController(initialPage: 0);
  final formKey = GlobalKey<FormState>();

  DreamFormController(super.ref);

  Future init(BuildContext context, {String? newTitle, String? dreamUuid}) async {
    try {
      if (newTitle == null && dreamUuid == null) {
        if (context.mounted) return Navigator.pop(context);
      }

      if (newTitle != null) {
        final result = await addNewDreamUsecase.perform(AddNewDreamUsecaseParams(newTitle));
        ref.read(dreamProvider.notifier).state = result;
        return;
      }

      if (dreamUuid != null) {
        final result = await getOneDreamByUuidUsecase.perform(GetOneDreamByUuidUsecaseParams(dreamUuid));
        ref.read(dreamProvider.notifier).state = result;
        return;
      }
    } catch (e) {
      if (context.mounted) return Navigator.pop(context);
    }
    if (context.mounted) Navigator.pop(context);
  }

  void goToMainFormPage() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void goToContentFormPage() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  ///
  String? validateDreamTitle(String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ton rêve !';
    if (value.length > 40) return 'Ton titre doit-être moins long (4O caractères maximum) !';

    ref.read(dreamProvider.notifier).state = ref.read(dreamProvider)!.copyWith(title: value);
    _isDreamModified();
    return null;
  }

  ///
  String? validateDreamChapter(int index, String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ce chapitre !';
    if (value.length > 40) return 'Le titre de ce chapitre doit-être moins long (4O caractères maximum) !';

    ref.read(dreamProvider.notifier).state = ref.read(dreamProvider)!.copyWith(title: value);
    _isDreamModified();
    return null;
  }

  ///
  String? validateDreamContent(int index, String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ce chapitre !';
    if (value.length > 255) return 'Le titre de ce chapitre doit-être moins long (255 caractères maximum) !';

    ref.read(dreamProvider.notifier).state = ref.read(dreamProvider)!.copyWith(title: value);
    _isDreamModified();
    return null;
  }

  /// Just check if there are differences between data in back and data store in dreamProvider.
  /// Allow us to display a text that's tell user that his form has not been saved yet.
  Future _isDreamModified() async {
    final currentDream = ref.read(dreamProvider);
    if (currentDream == null) return false;
    final initialDream = await getOneDreamByUuidUsecase.perform(GetOneDreamByUuidUsecaseParams(currentDream.uuid));
    ref.read(isDreamUpdatedProvider.notifier).state = initialDream != currentDream;
  }
}

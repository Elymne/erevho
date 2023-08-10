import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:erevho/features/main/domain/usecases/dreams/add_new_dream_usecase.dart';
import 'package:erevho/features/main/domain/usecases/dreams/get_one_dream_by_uuid_usecase.dart';
import 'package:erevho/features/main/domain/usecases/dreams/update_dream_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final dreamFormControllerProvider = Provider((ref) => DreamFormController(ref));

class DreamFormController extends Controller {
  late final AddNewDreamUsecase addNewDreamUsecase = ref.read(addNewDreamUsecaseProvider);
  late final GetOneDreamByUuidUsecase getOneDreamByUuidUsecase = ref.read(getOneDreamByUuidUsecaseProvider);
  late final UpdateDreamUsecase updateDreamUsecase = ref.read(updateDreamUsecaseProvider);

  final dreamProvider = StateProvider<Dream?>((ref) => null);

  final isDreamUpdatedProvider = StateProvider<bool>((ref) => false);
  final currentPageIndexProvider = StateProvider<int>((ref) => 0);

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
      // todo message d'erreur.
      if (context.mounted) return Navigator.pop(context);
    }
    // todo message d'erreur.
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

  void returnToUserHomePage(BuildContext context) {
    Navigator.pop(context);
  }

  String? validateDreamTitle(String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ton rêve !';
    if (value.length > 60) return 'Ton titre doit-être moins long (4O caractères maximum) !';

    ref.read(dreamProvider.notifier).state = ref.read(dreamProvider)!.copyWith(title: value);
    _isDreamModified();
    return null;
  }

  String? validateDreamChapter(int index, String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ce chapitre !';
    if (value.length > 60) return 'Le titre de ce chapitre doit-être moins long (4O caractères maximum) !';

    final dream = ref.read(dreamProvider);
    if (dream == null) return "Can't find the dream, strange";

    ref.read(dreamProvider.notifier).state = dream.copyWith(
      chapters: [
        for (var chapter in dream.chapters)
          if (chapter.number == dream.chapters[index].number) chapter.copyWith(title: value) else chapter
      ],
    );

    _isDreamModified();
    return null;
  }

  String? validateDreamContent(int index, String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ce chapitre !';
    if (value.length > 255) return 'Le titre de ce chapitre doit-être moins long (255 caractères maximum) !';

    final dream = ref.read(dreamProvider);
    if (dream == null) return "Can't find the dream, strange";

    ref.read(dreamProvider.notifier).state = dream.copyWith(
      chapters: [
        for (var chapter in dream.chapters)
          if (chapter.number == dream.chapters[index].number) chapter.copyWith(content: value) else chapter
      ],
    );

    _isDreamModified();
    return null;
  }

  Future saveCurrentDream() async {
    if (formKey.currentState!.validate()) {
      /// Display loading screen.
      final updatedDream = ref.read(dreamProvider);

      if (updatedDream == null) {
        /// Hide loading. Display screen error maybe ? We'll see.
        return;
      }

      try {
        await updateDreamUsecase.perform(UpdateDreamUsecaseParams(updatedDream));

        /// Hide loading. The dream is saved, gg enculé.
      } catch (_) {
        /// Hide loading.
        /// Affichage message d'erreur.
      }
    }
  }

  ///
  void changeCurrentPageIndex(int index) {
    ref.read(currentPageIndexProvider.notifier).state = index;
  }

  ///
  void addNewChapter() {
    final dream = ref.read(dreamProvider);
    if (dream == null) return;

    final newChapterNumber = dream.chapters.length + 1;

    final blankChapter = Chapter(
      uuid: const Uuid().v4(),
      number: newChapterNumber,
      title: '',
      content: '',
      created: DateTime.now(),
      updated: DateTime.now(),
    );

    ref.read(dreamProvider.notifier).state = dream.copyWith(chapters: [
      ...dream.chapters,
      blankChapter,
    ]);
  }

  /// Just check if there are differences between data in back and data store in dreamProvider.
  /// Allow us to display a text that's tell user that his form has not been saved yet.
  /// May not be very performant, as I call data structure every time a field is updated and validated.
  Future _isDreamModified() async {
    final currentDream = ref.read(dreamProvider);
    if (currentDream == null) return false;
    final initialDream = await getOneDreamByUuidUsecase.perform(GetOneDreamByUuidUsecaseParams(currentDream.uuid));
    ref.read(isDreamUpdatedProvider.notifier).state = initialDream != currentDream;
  }
}

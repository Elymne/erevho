import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/content_dream_form.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/main_dream_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DreamFormPage extends ConsumerStatefulWidget {
  final String? newTitle;
  final String? dreamUuid;

  const DreamFormPage({super.key, this.newTitle, this.dreamUuid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<DreamFormPage> {
  late final DreamFormController controller = ref.read(dreamFormControllerProvider);
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  @override
  void initState() {
    super.initState();
    controller.init(context, newTitle: widget.newTitle, dreamUuid: widget.dreamUuid);
  }

  @override
  Widget build(BuildContext context) {
    final dream = ref.watch(controller.dreamProvider);
    final chapters = ref.watch(controller.chaptersProvider);
    final currentPageIndex = ref.watch(controller.currentPageIndexProvider);

    if (dream == null || chapters == null) {
      return const Center(
        child: Text("loading"),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: erevohDark,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                if (currentPageIndex == 0)
                  AutoSizeText(
                    alt.current.dream_form_title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                if (currentPageIndex == 1)
                  ElevatedButton(
                    onPressed: () => controller.goToMainFormPage(),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: erevohOrange,
                      fixedSize: const Size(40, 40),
                    ),
                    child: const Icon(Icons.arrow_left_outlined),
                  ),
                if (currentPageIndex == 1) const Expanded(child: SizedBox()),
                if (currentPageIndex == 1)
                  const AutoSizeText(
                    'Modifier le contenu',
                    style: TextStyle(fontSize: 28),
                  ),
                if (currentPageIndex == 1) const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Form(
                key: controller.formKey,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.changeCurrentPageIndex(index);
                  },
                  children: [
                    MainDreamForm(
                      alt: alt,
                      validator: (value) => controller.validateDreamTitle(value),
                      dreamTitle: dream.title,
                      onContentDreamFormAccess: () => controller.goToContentFormPage(),
                      onPushBack: () => controller.popBack(context),
                      onSave: () => controller.saveCurrentDream(),
                    ),
                    ContentDreamForm(
                      chapters: chapters,
                      validateDreamChapter: (index, value) => controller.validateDreamChapter(index, value),
                      validateDreamContent: (index, value) => controller.validateDreamContent(index, value),
                      onChapterAdd: () => controller.addNewChapter(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/chapter_form.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/chapter_form_add.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/main_dream_form.dart';
import 'package:erevho/features/main/application/widgets/pager/pager_style.dart';
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
    final currentPageIndex = ref.watch(controller.currentPageIndexProvider);

    if (dream == null) {
      return const Center(
        child: Text("loading"),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: erevohDark,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            // Title for main content.
            if (currentPageIndex == 0)
              AutoSizeText(
                alt.current.dream_form_title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),

            // Title for chapters contents.
            if (currentPageIndex == 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.goToMainFormPage(),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: erevohOrange,
                      fixedSize: const Size(40, 40),
                    ),
                    child: const Icon(Icons.arrow_left_outlined),
                  ),
                  const Expanded(child: SizedBox()),
                  const AutoSizeText(
                    'Modifier le contenu',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Expanded(
              child: Form(
                key: controller.formKey,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: 1 + dream.chapters.length + 1,
                  onPageChanged: (index) {
                    controller.changeCurrentPageIndex(index);
                  },
                  itemBuilder: (context, index) {
                    // Lel.
                    if (index == 0) {
                      return MainDreamForm(
                        alt: alt,
                        validator: (value) => controller.validateDreamTitle(value),
                        dreamTitle: dream.title,
                        onContentDreamFormAccess: () => controller.goToContentFormPage(),
                        onPushBack: () => controller.returnToUserHomePage(context),
                        onSave: () => controller.saveCurrentDream(),
                      );
                    }
                    // Lel.
                    if (index == (1 + dream.chapters.length)) {
                      return ChapterFormAdd(
                        alt: alt,
                        onChapterAdd: () => controller.addNewChapter(),
                      );
                    }
                    // Lel.
                    return ChapterForm(
                      alt: alt,
                      validateChapterTitle: (index, value) => controller.validateDreamChapter(index, value),
                      validateChapterContent: (index, value) => controller.validateDreamContent(index, value),
                      chapter: dream.chapters[index - 1],
                    );
                  },
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: PagerDots(
                currentPage: currentPageIndex,
                totalPages: dream.chapters.length + 1,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

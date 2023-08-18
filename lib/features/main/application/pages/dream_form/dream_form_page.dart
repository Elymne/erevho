import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/chapter_form.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/chapter_form_add.dart';
import 'package:erevho/features/main/application/pages/dream_form/pages/main_dream_form.dart';
import 'package:erevho/features/main/application/widgets/pager/pager_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/dream_form_header.dart';

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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                MainDreamFormHeader(alt: alt, currentPage: currentPageIndex),
                const SizedBox(height: 20),
                Expanded(
                  child: Form(
                    key: controller.formKey,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: 1 + dream.chapters.length + 1,
                      onPageChanged: (index) {
                        controller.onPageChange(index);
                      },
                      itemBuilder: (context, index) {
                        // First page's always the page with Dream title and tags editions.
                        if (index == 0) {
                          return MainDreamForm(
                            alt: alt,
                            validator: (value) => controller.validateDreamTitle(value),
                            dreamTitle: dream.title,
                            onContentDreamFormAccess: () => controller.goToContentFormPage(),
                            onPushBack: () => controller.returnToUserHomePage(context),
                            onSave: () => controller.saveCurrentDream(),
                            onDreamTitleChange: (value) => controller.onDreamTitleChanged(value),
                          );
                        }

                        // Last page's always the page that allow a user to add a new chapter.
                        if (index == (1 + dream.chapters.length)) {
                          return ChapterFormAdd(
                            alt: alt,
                            onChapterAdd: () => controller.addNewChapter(),
                          );
                        }
                        // And between this, there's chapters.
                        return ChapterForm(
                          alt: alt,
                          chapter: dream.chapters[index - 1],
                          validateTitle: (value) => controller.validateDreamChapterTitle(value),
                          validateContent: (value) => controller.validateDreamChapterContent(value),
                          onTitleChanged: (number, value) => controller.onDreamChapterTitleChanged(number - 1, value),
                          onContentChanged: (number, value) => controller.onDreamChapterContentChanged(number - 1, value),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: PagerDots(
                    currentPage: currentPageIndex,
                    totalPages: dream.chapters.length + 2,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
            ElevatedButton(
              onPressed: () => controller.goToMainFormPage(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: erevohOrange,
                fixedSize: const Size(40, 40),
              ),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

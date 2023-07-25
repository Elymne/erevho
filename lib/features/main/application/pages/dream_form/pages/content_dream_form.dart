import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/extensions/int_extension.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_text_field.dart';
import 'package:erevho/features/main/application/widgets/pager/pager_style.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentDreamForm extends ConsumerStatefulWidget {
  final Dream dream;
  final String? Function(int index, String? value) validateDreamChapter;
  final String? Function(int index, String? value) validateDreamContent;
  final void Function() onMainDreamFormAccess;

  const ContentDreamForm({
    super.key,
    required this.dream,
    required this.validateDreamChapter,
    required this.validateDreamContent,
    required this.onMainDreamFormAccess,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<ContentDreamForm> {
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);
  final PageController _pageController = PageController(initialPage: 0);
  final _currentPageProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(_currentPageProvider);

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.dream.chapters.length + 1,
            onPageChanged: (index) {
              ref.read(_currentPageProvider.notifier).state = index;
            },
            itemBuilder: ((context, index) {
              if (index >= widget.dream.chapters.length) {
                return const Center(
                  child: Text("ADD ONE CHAPTER LEL"),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(height: 60), // Just to minimize the jump effect when changing current page.
                        ElevatedButton(
                          onPressed: () => widget.onMainDreamFormAccess(),
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
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AutoSizeText.rich(
                      TextSpan(
                        text: alt.current.dream_form_chapter_textfield,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: (index + 1).romanNumber,
                            style: const TextStyle(
                              fontSize: 22,
                              color: erevohOrange,
                              fontFamily: 'Lunasima',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    ErevohTextField(
                      initialValue: widget.dream.chapters[index].title,
                      validator: (value) => widget.validateDreamChapter(index, value),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: ErevohTextField(
                        labelText: alt.current.dream_form_content_textfield,
                        initialValue: widget.dream.chapters[index].content,
                        maxLines: 10,
                        validator: (value) => widget.validateDreamContent(index, value),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: PagerDots(
            currentPage: currentPage,
            totalPages: widget.dream.chapters.length + 1,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

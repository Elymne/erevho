import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/extensions/int_extension.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_text_field.dart';
import 'package:erevho/features/main/domain/entities/dreams/dream.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentDreamForm extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            PageView.builder(
              itemCount: dream.chapters.length + 1,
              itemBuilder: ((context, index) {
                if (index >= dream.chapters.length) {
                  return const Center(
                    child: Text("ADD ONE CHAPTER LEL"),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        initialValue: dream.chapters[index].title,
                        validator: (value) => validateDreamChapter(index, value),
                      ),
                      const SizedBox(height: 6),
                      ErevohTextField(
                        labelText: alt.current.dream_form_content_textfield,
                        initialValue: dream.chapters[index].content,
                        maxLines: 6,
                        validator: (value) => validateDreamContent(index, value),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => onMainDreamFormAccess(),
              child: const AutoSizeText(
                'Modifier le contenu du rêve',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_chapter_title_textfield.dart';
import 'package:erevho/features/main/application/widgets/forms/erevoh_text_field.dart';
import 'package:erevho/features/main/domain/entities/dreams/chapter.entity.dart';
import 'package:flutter/material.dart';

class ChapterForm extends StatelessWidget {
  final AppLocalisationTools alt;
  final String? Function(String? value) validateTitle;
  final String? Function(String? value) validateContent;
  final void Function(int number, String value) onTitleChanged;
  final void Function(int number, String value) onContentChanged;
  final Chapter chapter;

  const ChapterForm({
    super.key,
    required this.alt,
    required this.validateTitle,
    required this.validateContent,
    required this.chapter,
    required this.onTitleChanged,
    required this.onContentChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Chapter title and content update.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErevohChapterTitleTextField(
            title: alt.current.dream_form_chapter_textfield,
            chapterNumber: chapter.number,
            initialValue: chapter.title,
            validator: (value) => validateTitle(value),
            onChanged: (value) => onTitleChanged(chapter.number, value),
          ),
          const SizedBox(height: 6),
          ErevohTextField(
            labelText: alt.current.dream_form_content_textfield,
            initialValue: chapter.content,
            maxLines: null,
            validator: (value) => validateContent(value),
          ),
        ],
      ),
    );
  }
}

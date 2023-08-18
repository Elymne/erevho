import 'package:erevho/core/extensions/int_extension.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ErevohChapterTitleTextField extends StatelessWidget {
  final String title;
  final int chapterNumber;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?) validator;
  final void Function(String) onChanged;

  const ErevohChapterTitleTextField({
    required this.validator,
    required this.title,
    required this.chapterNumber,
    required this.onChanged,
    this.hintText,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        TextFormField(
          validator: (value) => validator(value),
          onChanged: (value) => onChanged(value),
          initialValue: initialValue,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            hintText: '$title ${chapterNumber.romanNumber}',
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 30,
            ),
            errorStyle: const TextStyle(
              fontSize: 18,
              color: erevohRed,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

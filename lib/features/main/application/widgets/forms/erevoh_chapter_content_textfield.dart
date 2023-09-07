import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ErevohChapterContentTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?) validator;
  final void Function(String) onChanged;

  const ErevohChapterContentTextField({
    required this.validator,
    required this.title,
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
          maxLines: null,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: title,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
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

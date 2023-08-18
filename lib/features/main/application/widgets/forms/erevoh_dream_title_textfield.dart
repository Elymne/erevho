import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ErevohDreamTitleTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?) validator;
  final void Function(String) onChange;

  const ErevohDreamTitleTextField({
    required this.validator,
    required this.title,
    required this.onChange,
    this.hintText,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
            children: const [],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          validator: (value) => validator(value),
          onChanged: (value) => onChange(value),
          initialValue: initialValue,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            hintText: title,
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

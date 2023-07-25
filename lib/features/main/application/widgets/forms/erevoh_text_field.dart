import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ErevohTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool expanded;
  final int? maxLines;
  final String? Function(String?) validator;

  const ErevohTextField({
    required this.validator,
    this.labelText,
    this.hintText,
    this.initialValue,
    super.key,
    this.maxLines,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          AutoSizeText(
            labelText!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        if (labelText != null) const SizedBox(height: 6),
        TextFormField(
          validator: (value) => validator(value),
          initialValue: initialValue,
          expands: expanded,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 18,
            ),
            filled: true,
            fillColor: erevohBlue,
            // Default border when nothing is clicked (but can be clicked).
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: erevohBlack.withOpacity(0.8),
                width: 2.0,
              ),
            ),

            // When clicked.
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: erevohBlack.withOpacity(0.8),
                width: 2.0,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: erevohRed.withOpacity(0.8),
                width: 2.0,
              ),
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

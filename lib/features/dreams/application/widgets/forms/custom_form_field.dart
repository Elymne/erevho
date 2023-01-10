import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final String? initialValue;
  final String hintText;
  final TextFieldType textFieldType;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  const CustomFormField({Key? key, required this.validator, required this.hintText, required this.textFieldType, this.initialValue, required this.onSaved}) : super(key: key);

  /// TODO Styliser un peu tout ça
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: maxLines,
      maxLines: minLines,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: GoogleFonts.robotoFlex(
          fontSize: hintStyle,
        ),
        hintText: hintText,
        fillColor: nightGreyDarker,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }

  int? get maxLines {
    switch (textFieldType) {
      case TextFieldType.title:
        return 1;
      case TextFieldType.normal:
        return 1;
      case TextFieldType.content:
        return null;
    }
  }

  int? get minLines {
    switch (textFieldType) {
      case TextFieldType.title:
        return 1;
      case TextFieldType.normal:
        return 1;
      case TextFieldType.content:
        return 20;
    }
  }

  double get hintStyle {
    switch (textFieldType) {
      case TextFieldType.title:
        return 30;
      case TextFieldType.normal:
        return 18;
      case TextFieldType.content:
        return 18;
    }
  }
}

enum TextFieldType { title, normal, content }

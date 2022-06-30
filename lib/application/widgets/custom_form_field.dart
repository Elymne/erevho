import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final String? initialValue;
  final String hintText;
  final bool isContent;
  final String? Function(String?) validator;

  const CustomFormField({Key? key, required this.validator, required this.hintText, required this.isContent, this.initialValue}) : super(key: key);

  /// TODO Styliser un peu tout ça
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isContent ? null : 1,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: GoogleFonts.robotoFlex(),
        hintText: hintText,
        fillColor: nightGreyDarker,
      ),
      validator: validator,
    );
  }
}

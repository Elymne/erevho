import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String text) onSubmitted;

  const CustomSearchBar({Key? key, required this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: GoogleFonts.robotoFlex(),
        hintText: "Recherche",
        fillColor: nightGreyDarker,
      ),
      onSubmitted: (text) => onSubmitted(text),
    );
  }
}

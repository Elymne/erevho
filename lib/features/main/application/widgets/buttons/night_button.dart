import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NightButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const NightButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => nightOrange),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          text,
          style: GoogleFonts.robotoFlex(
            fontSize: 20,
            color: pureWhite,
          ),
        ),
      ),
    );
  }
}

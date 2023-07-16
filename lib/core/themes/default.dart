import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData get defaultTheme {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue.shade300,
    secondaryHeaderColor: Colors.blueAccent.shade400,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: erevohGrey,
      onPrimary: erevohWhite,
      secondary: erevohBlue,
      onSecondary: erevohWhite,
      error: erevohRed,
      onError: erevohWhite,
      background: erevohDark,
      onBackground: erevohWhite,
      surface: erevohGrey,
      onSurface: erevohWhite,
    ),
    fontFamily: 'YsabeauInfant',
  );
}

import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData get defaultTheme {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue.shade300,
    secondaryHeaderColor: Colors.blueAccent.shade400,
    backgroundColor: nightGrey,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _iconColor = Colors.blueAccent.shade200;
  static const Color _primaryColor = Color(0xFF546E7A);
  static const Color _primaryVariantColor = Color(0xFF546E7A);
  static const Color _secondaryColor = Colors.green;
  static const Color _onPrimaryColor = Colors.black;
  static const Color _backgroundColor = Colors.grey;

  static final ThemeData defaultTheme = ThemeData(
      // APPBAR THEME.
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: _onPrimaryColor, fontFamily: "Roboto", fontWeight: FontWeight.bold, fontSize: 26),
        color: _primaryVariantColor,
        iconTheme: IconThemeData(color: _onPrimaryColor),
      ),
      // COLOR SCHEMES
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        onPrimary: _onPrimaryColor,
      ),
      // COLOR BACKGROUND.
      scaffoldBackgroundColor: _backgroundColor,
      // COLOR ICON?
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      // TEXT THEME.
      textTheme: _textTheme,
      // DIVIDE THEME.
      dividerTheme: const DividerThemeData(color: Colors.black12));

  static const TextTheme _textTheme = TextTheme(
    headline1: _screenHeading1TextStyle,
  );

  static const TextStyle _screenHeading1TextStyle = TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: _onPrimaryColor, fontFamily: "Roboto");
}

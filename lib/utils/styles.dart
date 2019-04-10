import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static final _theme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: primaryColor,
    primaryColorBrightness: Brightness.dark,
    accentColor: accentColor,
    accentColorBrightness: Brightness.dark,
    buttonColor: Colors.blue,
    textSelectionColor: Colors.blue[200],
    textSelectionHandleColor: Colors.orange[800],
    indicatorColor: Colors.white,
  );

  static ThemeData get theme => _theme;

  static Color get accentColor => Colors.orange[800];

  static Color get primaryColor => Colors.blue[700];

  static Color get primaryTextColor => Colors.white;

  static Color get accentTextColor => Colors.white;

  static Color get darkGrey => Colors.grey[700];

  static Color get errorRed => Colors.red[700];

  static Color get linkColor => Color(0xFF0645AD);
}

import 'package:flutter/material.dart';

final ThemeData primaryTheme = ThemeData(
  primaryColor: Colors.blueGrey,
  chipTheme: const ChipThemeData(
    selectedColor: Color.fromARGB(255, 170, 107, 55),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black87,
  chipTheme: const ChipThemeData(
    selectedColor: Color.fromARGB(255, 245, 208, 161),
  ),
);

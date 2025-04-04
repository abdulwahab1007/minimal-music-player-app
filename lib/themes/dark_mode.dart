import 'package:flutter/material.dart';

ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 24, 24, 24),
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade900,
    inversePrimary: Colors.grey.shade200
  ),
  textTheme: const TextTheme().apply(
    bodyColor: Colors.grey.shade300,
    displayColor: Colors.grey.shade200
  )
);
import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade200,
    inversePrimary: Colors.grey.shade800
  ),
  textTheme: const TextTheme().apply(
    bodyColor: Colors.grey.shade800,
    displayColor: Colors.grey.shade800
  )
);
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(int page) {
    switch (page) {
      case 0:
        return ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF027373),
            onPrimary: Color(0xFFFFF2EB),
            secondary: Color(0xFFFFAE1F),
            onSecondary: Color(0xFF262626),
            surface: Color(0xFF6AABAB),
            onSurface: Color(0xFF262626),
            background: Color(0xFFF2E7DC),
            onBackground: Color(0xFF262626),
            error: Color(0xFFFF0601),
            onError: Color(0xFF262626),
          ),
        );
      case 1:
        return ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF8F1D04),
            onPrimary: Color(0xFFF2F2F2),
            secondary: Color(0xFF048F5D),
            onSecondary: Color(0xFFBFBFBF),
            surface: Color(0xFF313131),
            onSurface: Color(0xFFD7D7D7),
            background: Color(0xFFD7D7D7),
            onBackground: Color(0xFF262626),
            error: Color(0xFFFF0601),
            onError: Color(0xFF262626),
          ),
        );
      case 2:
        return ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF03588C),
            onPrimary: Color(0xFFF2F2F2),
            secondary: Color(0xFFF24150),
            onSecondary: Color(0xFFBFBFBF),
            surface: Color(0xFF04B2D9),
            onSurface: Color(0xFF131313),
            background: Color(0xFFF2BE7E),
            onBackground: Color(0xFF131313),
            error: Color(0xFFFF0601),
            onError: Color(0xFF131313),
          ),
        );
      default:
        return ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF027373),
            onPrimary: Color(0xFFFFF2EB),
            secondary: Color(0xFFFF5E00),
            onSecondary: Color(0xFF0D0D0D),
            surface: Color(0xFF6AABAB),
            onSurface: Color(0xFF262626),
            background: Color(0xFFF2E7DC),
            onBackground: Color(0xFF262626),
            error: Color(0xFFFF0601),
            onError: Color(0xFF0D0D0D),
          ),
        );
    }
  }
}

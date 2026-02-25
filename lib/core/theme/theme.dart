import 'package:flutter/material.dart';

/// Centralized theme definition.
///
/// Design intent:
/// - Dark cinematic background
/// - Gold accents for premium actions and highlights
/// - White typography with strong contrast and generous readability
class AppTheme {
  AppTheme._();

  static const Color _black = Color(0xFF0A0A0A);
  static const Color _surface = Color(0xFF121212);
  static const Color _gold = Color(0xFFD4AF37);
  static const Color _softGold = Color(0xFFE6C76E);
  static const Color _white = Color(0xFFF8F8F8);

  static ThemeData get darkTheme {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _gold,
      brightness: Brightness.dark,
      surface: _surface,
      primary: _gold,
      secondary: _softGold,
      onPrimary: _black,
      onSurface: _white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _black,
      fontFamily: 'sans-serif',
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontFamily: 'serif',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: _white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'serif',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
          color: _white,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          color: _white,
        ),
        bodyLarge: TextStyle(
          height: 1.4,
          color: _white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      cardTheme: CardTheme(
        elevation: 0,
        color: _surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0x26D4AF37)),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _gold,
          foregroundColor: _black,
          elevation: 0,
          minimumSize: const Size(180, 54),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            letterSpacing: 0.4,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

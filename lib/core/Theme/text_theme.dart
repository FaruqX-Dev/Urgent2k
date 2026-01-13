import 'package:flutter/material.dart';

class AppTextTheme {
  // Light Theme Text
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: -0.5,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    ),
  );

  // Dark Theme Text (matching your offline-first/pro feel)
  static final TextTheme darkTextTheme = lightTextTheme.copyWith(
    displayLarge: lightTextTheme.displayLarge?.copyWith(color: Colors.white),
    titleMedium: lightTextTheme.titleMedium?.copyWith(color: Colors.white70),
    bodyMedium: lightTextTheme.bodyMedium?.copyWith(color: Colors.white60),
    labelSmall: lightTextTheme.labelSmall?.copyWith(color: Colors.white38),
  );
}
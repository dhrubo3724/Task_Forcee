// lib/app/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(
      0xFF5C677D,
    ), // Your specified scaffold color
    cardColor: const Color(0xFF979DAC), // Your specified card color
    primaryColor: const Color(0xFF979DAC), // Your specified yellow accent
    // ColorScheme is important for Material 3 components to pick up primary/accent colors correctly.
    // We'll derive it from your primaryColor.
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF556B2F), // Your yellow accent
      brightness: Brightness.dark,
      // You might want to explicitly set other ColorScheme colors if the defaults from seed aren't perfect:
      // background: const Color(0xFF0D0D0D), // Usually same as scaffoldBackgroundColor
      // surface: const Color(0xFF1A1A1A),    // Usually same as cardColor
      // onPrimary: Colors.black, // Text on your yellow primary color
      // onBackground: Colors.white,
      // onSurface: Colors.white,
    ),

    textTheme: const TextTheme(
      // Your specified text styles:
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ), // Added common font size
      bodyMedium: TextStyle(
        color: Color(0xFFB3B3B3),
        fontSize: 14.0,
      ), // Added common font size
      // It's good practice to define more styles for consistency, even if not in your original ThemeData:
      // Example:
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 57.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
      ), // For AppBars etc.
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ), // For Buttons
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ), // Your specified icon theme

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF979DAC), // Your specified AppBar background
      foregroundColor: Color(
        0xFF979DAC,
      ), // Your specified AppBar foreground (icons, text)
      elevation: 0, // Common for dark themes
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ), // Explicit title style
    ),

    // It's also good to define other component themes for consistency:
    // Example for CardTheme (to ensure it uses cardColor and has consistent shape/margin)
    cardTheme: CardTheme(
      color: const Color(0xFF1A1A1A), // Explicitly use your cardColor
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),

    // Example for ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF979DAC), // Use your primaryColor
        foregroundColor: Colors.black, // Text color on button
        textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
    ),
    useMaterial3: true, // Recommended for new projects
  );

  // If you had a light theme, it would go here:
  // static final ThemeData lightTheme = ThemeData(...);
}

// lib/app/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(
      0xFF1E1E2F,
    ), // Your specified scaffold color
    cardColor: const Color(0xFF2C3E50), // Your specified card color
    primaryColor: const Color(0xFF2ECC71), // Your specified yellow accent
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
        color: Color(0xFFEAEAEA),
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
      backgroundColor: Color(0xFF2C3E50), // Your specified AppBar background
      foregroundColor: Color(
        0xFFEAEAEA,
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
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    cardColor: const Color(0xFF2C3E50),
    primaryColor: const Color(0xFF2ECC71),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF556B2F),
      brightness: Brightness.light,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16.0),
      bodyMedium: TextStyle(color: Color(0xFF2C3E50), fontSize: 14.0),

      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 57.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2C3E50),
      foregroundColor: Color(0xFF2C3E50),
      elevation: 1, // Common for dark themes
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
    useMaterial3: true,
  );
}

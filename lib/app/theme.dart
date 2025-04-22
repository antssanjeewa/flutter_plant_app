import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.light,
      foregroundColor: AppColors.dark,
      elevation: 0,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.dark)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
      primary: Colors.green,
      primaryContainer: Colors.green.shade100,
      secondary: Colors.grey.shade200,
      onPrimary: Colors.white,
      surface: Colors.grey.shade100,
      onSurface: Colors.grey.shade600,
    ),
    dividerColor: Colors.grey.shade300,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dark,
      foregroundColor: AppColors.light,
      elevation: 0,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.light)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark,
      primary: Colors.green,
      primaryContainer: Colors.green.shade900,
      secondary: Colors.grey.shade800,
      onPrimary: Colors.white,
      surface: Colors.grey.shade900,
      onSurface: Colors.grey.shade100,
    ),
    dividerColor: Colors.grey.shade600,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark,
      selectedItemColor: Colors.lightGreenAccent,
      unselectedItemColor: Colors.grey.shade500,
    ),
    useMaterial3: true,
  );
}

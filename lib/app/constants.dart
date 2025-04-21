import 'package:flutter/material.dart';

/// Colors
class AppColors {
  static const light = Colors.white;
  static const dark = Colors.black;
  static const grey = Colors.black54;
  static const primary = Color(0xFF4CAF50);
  static const secondary = Color(0xFF4CAF50);
}

/// Tailwind-like Font Sizes
class FontSize {
  static const double xs = 12;
  static const double sm = 14;
  static const double base = 16;
  static const double lg = 18;
  static const double xl = 20;
  static const double xxl = 45;
}

/// Spacing
class AppSize {
  static const double xs = 10;
  static const double sm = 15;
  static const double base = 20;
  static const double lg = 30;
  static const double xl = 40;
}

class AppTextStyles {
  static const TextStyle body = TextStyle(
    fontSize: FontSize.base,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: FontSize.base,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading = TextStyle(fontSize: FontSize.xxl);

  static const TextStyle headingBold = TextStyle(
    fontSize: FontSize.xxl,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: FontSize.lg,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle small = TextStyle(
    fontSize: FontSize.sm,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle button = TextStyle(
    fontSize: FontSize.base,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

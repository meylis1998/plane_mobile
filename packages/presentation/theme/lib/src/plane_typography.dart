import 'package:flutter/material.dart';

/// Material 3 type scale for the Plane app.
abstract final class PlaneTypography {
  static const String _fontFamily = 'Inter';

  // Display
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
  );

  // Headline
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
  );

  // Title
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.27,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.50,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Label
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  /// Returns the full [TextTheme] built from Plane typography styles.
  static TextTheme textTheme({Color? color}) {
    final appliedColor = color;
    return TextTheme(
      displayLarge: appliedColor != null
          ? displayLarge.copyWith(color: appliedColor)
          : displayLarge,
      displayMedium: appliedColor != null
          ? displayMedium.copyWith(color: appliedColor)
          : displayMedium,
      displaySmall: appliedColor != null
          ? displaySmall.copyWith(color: appliedColor)
          : displaySmall,
      headlineLarge: appliedColor != null
          ? headlineLarge.copyWith(color: appliedColor)
          : headlineLarge,
      headlineMedium: appliedColor != null
          ? headlineMedium.copyWith(color: appliedColor)
          : headlineMedium,
      headlineSmall: appliedColor != null
          ? headlineSmall.copyWith(color: appliedColor)
          : headlineSmall,
      titleLarge: appliedColor != null
          ? titleLarge.copyWith(color: appliedColor)
          : titleLarge,
      titleMedium: appliedColor != null
          ? titleMedium.copyWith(color: appliedColor)
          : titleMedium,
      titleSmall: appliedColor != null
          ? titleSmall.copyWith(color: appliedColor)
          : titleSmall,
      bodyLarge: appliedColor != null
          ? bodyLarge.copyWith(color: appliedColor)
          : bodyLarge,
      bodyMedium: appliedColor != null
          ? bodyMedium.copyWith(color: appliedColor)
          : bodyMedium,
      bodySmall: appliedColor != null
          ? bodySmall.copyWith(color: appliedColor)
          : bodySmall,
      labelLarge: appliedColor != null
          ? labelLarge.copyWith(color: appliedColor)
          : labelLarge,
      labelMedium: appliedColor != null
          ? labelMedium.copyWith(color: appliedColor)
          : labelMedium,
      labelSmall: appliedColor != null
          ? labelSmall.copyWith(color: appliedColor)
          : labelSmall,
    );
  }
}

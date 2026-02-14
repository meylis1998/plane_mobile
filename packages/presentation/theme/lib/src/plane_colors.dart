import 'package:flutter/material.dart';

/// Design system color palette for the Plane app.
abstract final class PlaneColors {
  // Brand
  static const Color primary = Color(0xFF3F76FF);
  static const Color primaryLight = Color(0xFF6B99FF);
  static const Color primaryDark = Color(0xFF2A5BD6);
  static const Color primarySurface = Color(0xFFEBF1FF);

  // Semantic
  static const Color success = Color(0xFF16A34A);
  static const Color successLight = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);

  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Background & Surface (Light)
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF3F4F6);

  // Background & Surface (Dark)
  static const Color backgroundDark = Color(0xFF111827);
  static const Color surfaceDark = Color(0xFF1F2937);
  static const Color surfaceVariantDark = Color(0xFF374151);

  // Priority colors
  static const Color priorityUrgent = Color(0xFFEF4444);
  static const Color priorityHigh = Color(0xFFF97316);
  static const Color priorityMedium = Color(0xFFEAB308);
  static const Color priorityLow = Color(0xFF3B82F6);
  static const Color priorityNone = Color(0xFF9CA3AF);

  // State group colors
  static const Color stateBacklog = Color(0xFF9CA3AF);
  static const Color stateUnstarted = Color(0xFF6B7280);
  static const Color stateStarted = Color(0xFFF59E0B);
  static const Color stateCompleted = Color(0xFF16A34A);
  static const Color stateCancelled = Color(0xFFEF4444);

  // Text colors (Light)
  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textTertiaryLight = Color(0xFF9CA3AF);
  static const Color textDisabledLight = Color(0xFFD1D5DB);

  // Text colors (Dark)
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
  static const Color textTertiaryDark = Color(0xFF6B7280);
  static const Color textDisabledDark = Color(0xFF4B5563);

  // Border colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF374151);

  // Divider
  static const Color dividerLight = Color(0xFFE5E7EB);
  static const Color dividerDark = Color(0xFF374151);
}

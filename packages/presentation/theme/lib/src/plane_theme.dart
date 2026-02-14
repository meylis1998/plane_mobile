import 'package:flutter/material.dart';
import 'package:theme/src/plane_colors.dart';
import 'package:theme/src/plane_radius.dart';
import 'package:theme/src/plane_typography.dart';

/// Provides light and dark [ThemeData] for the Plane app.
abstract final class PlaneTheme {
  /// Light theme.
  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      primary: PlaneColors.primary,
      primaryContainer: PlaneColors.primarySurface,
      onPrimaryContainer: PlaneColors.primaryDark,
      secondary: PlaneColors.grey600,
      onSecondary: PlaneColors.white,
      secondaryContainer: PlaneColors.grey100,
      onSecondaryContainer: PlaneColors.grey800,
      onSurface: PlaneColors.textPrimaryLight,
      surfaceContainerHighest: PlaneColors.surfaceVariantLight,
      onSurfaceVariant: PlaneColors.textSecondaryLight,
      errorContainer: PlaneColors.errorLight,
      outline: PlaneColors.borderLight,
      outlineVariant: PlaneColors.grey200,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      brightness: Brightness.light,
      scaffoldBackground: PlaneColors.backgroundLight,
      dividerColor: PlaneColors.dividerLight,
      textColor: PlaneColors.textPrimaryLight,
    );
  }

  /// Dark theme.
  static ThemeData dark() {
    const colorScheme = ColorScheme.dark(
      primary: PlaneColors.primary,
      onPrimary: PlaneColors.white,
      primaryContainer: PlaneColors.primaryDark,
      onPrimaryContainer: PlaneColors.primaryLight,
      secondary: PlaneColors.grey400,
      secondaryContainer: PlaneColors.grey700,
      onSecondaryContainer: PlaneColors.grey200,
      surface: PlaneColors.surfaceDark,
      onSurface: PlaneColors.textPrimaryDark,
      surfaceContainerHighest: PlaneColors.surfaceVariantDark,
      onSurfaceVariant: PlaneColors.textSecondaryDark,
      errorContainer: PlaneColors.errorLight,
      outline: PlaneColors.borderDark,
      outlineVariant: PlaneColors.grey700,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      brightness: Brightness.dark,
      scaffoldBackground: PlaneColors.backgroundDark,
      dividerColor: PlaneColors.dividerDark,
      textColor: PlaneColors.textPrimaryDark,
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
    required Color scaffoldBackground,
    required Color dividerColor,
    required Color textColor,
  }) {
    final textTheme = PlaneTypography.textTheme(color: textColor);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: textTheme,
      dividerColor: dividerColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0.5,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: PlaneTypography.titleLarge.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: PlaneRadius.md),
        color: colorScheme.surface,
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: PlaneRadius.md,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: PlaneRadius.md,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: PlaneRadius.md,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: PlaneRadius.md,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        hintStyle: PlaneTypography.bodyMedium.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        labelStyle: PlaneTypography.bodyMedium.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: PlaneRadius.md,
          ),
          textStyle: PlaneTypography.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: PlaneRadius.md,
          ),
          textStyle: PlaneTypography.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: PlaneRadius.md,
          ),
          textStyle: PlaneTypography.labelLarge,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: PlaneTypography.labelMedium,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: PlaneRadius.sm,
        ),
        side: BorderSide.none,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: PlaneRadius.circularXl,
          ),
        ),
        showDragHandle: true,
        dragHandleColor: colorScheme.outlineVariant,
      ),
      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        titleTextStyle: PlaneTypography.bodyLarge.copyWith(
          color: colorScheme.onSurface,
        ),
        subtitleTextStyle: PlaneTypography.bodySmall.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: PlaneRadius.md,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: PlaneRadius.md),
      ),
    );
  }
}

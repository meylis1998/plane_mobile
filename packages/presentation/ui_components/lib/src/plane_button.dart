import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Button variant types.
enum PlaneButtonVariant { primary, secondary, text, destructive }

/// A styled button with multiple variants and loading state support.
class PlaneButton extends StatelessWidget {
  const PlaneButton({
    required this.label,
    super.key,
    this.variant = PlaneButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.isExpanded = false,
    this.onPressed,
  });

  final String label;
  final PlaneButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final bool isExpanded;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveOnPressed = (isLoading || isDisabled) ? null : onPressed;

    final child = _buildChild(theme);

    Widget button;

    switch (variant) {
      case PlaneButtonVariant.primary:
        button = ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            disabledBackgroundColor:
                theme.colorScheme.primary.withValues(alpha: 0.5),
            disabledForegroundColor:
                theme.colorScheme.onPrimary.withValues(alpha: 0.7),
          ),
          child: child,
        );
      case PlaneButtonVariant.secondary:
        button = OutlinedButton(
          onPressed: effectiveOnPressed,
          child: child,
        );
      case PlaneButtonVariant.text:
        button = TextButton(
          onPressed: effectiveOnPressed,
          child: child,
        );
      case PlaneButtonVariant.destructive:
        button = ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: PlaneColors.error,
            foregroundColor: PlaneColors.white,
            disabledBackgroundColor:
                PlaneColors.error.withValues(alpha: 0.5),
            disabledForegroundColor:
                PlaneColors.white.withValues(alpha: 0.7),
          ),
          child: child,
        );
    }

    if (isExpanded) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  Widget _buildChild(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == PlaneButtonVariant.primary ||
                    variant == PlaneButtonVariant.destructive
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.primary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: PlaneSpacing.sm),
          Text(label),
        ],
      );
    }

    return Text(label);
  }
}

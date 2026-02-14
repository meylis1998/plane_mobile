import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A styled chip for labels, priorities, and states with color support.
class PlaneChip extends StatelessWidget {
  const PlaneChip({
    required this.label,
    super.key,
    this.color,
    this.textColor,
    this.icon,
    this.onTap,
    this.isSelected = false,
    this.onDeleted,
  });

  final String label;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isSelected;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = color?.withValues(alpha: 0.15) ??
        (isSelected
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surfaceContainerHighest);
    final fgColor = textColor ??
        color ??
        (isSelected
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onSurfaceVariant);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PlaneSpacing.sm,
          vertical: PlaneSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: PlaneRadius.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: fgColor),
              const SizedBox(width: PlaneSpacing.xs),
            ],
            Text(
              label,
              style: PlaneTypography.labelMedium.copyWith(color: fgColor),
            ),
            if (onDeleted != null) ...[
              const SizedBox(width: PlaneSpacing.xs),
              GestureDetector(
                onTap: onDeleted,
                child: Icon(Icons.close, size: 14, color: fgColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

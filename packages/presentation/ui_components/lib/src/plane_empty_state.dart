import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Empty state display with icon composition, title, subtitle, and optional
/// action button. The icon area supports both a simple [IconData] and a
/// fully custom [iconWidget] for richer illustrations.
class PlaneEmptyState extends StatelessWidget {
  const PlaneEmptyState({
    required this.title,
    super.key,
    this.message,
    this.icon,
    this.iconWidget,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? message;
  final IconData? icon;
  final Widget? iconWidget;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PlaneSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconWidget != null)
              iconWidget!
            else if (icon != null)
              _IconComposition(icon: icon!),
            const SizedBox(height: PlaneSpacing.lg),
            Text(
              title,
              style: PlaneTypography.titleMedium.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: PlaneSpacing.sm),
              Text(
                message!,
                style: PlaneTypography.bodyMedium.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: PlaneSpacing.lg),
              FilledButton.tonal(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A composed icon with a subtle circular background for empty states.
class _IconComposition extends StatelessWidget {
  const _IconComposition({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5);

    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      ),
      child: Icon(icon, size: 48, color: color),
    );
  }
}

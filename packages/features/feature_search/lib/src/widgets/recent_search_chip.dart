import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A chip for a recent search term. Tap to re-search, long-press to remove.
class RecentSearchChip extends StatelessWidget {
  const RecentSearchChip({
    required this.term,
    this.onTap,
    this.onRemove,
    super.key,
  });

  final String term;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      onLongPress: onRemove,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PlaneSpacing.sm + PlaneSpacing.xs,
          vertical: PlaneSpacing.xs + PlaneSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: PlaneRadius.full,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history,
              size: 14,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: PlaneSpacing.xs),
            Text(
              term,
              style: PlaneTypography.labelMedium.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

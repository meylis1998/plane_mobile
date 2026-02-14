import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Section divider with title and optional trailing action.
class PlaneSectionHeader extends StatelessWidget {
  const PlaneSectionHeader({
    required this.title,
    super.key,
    this.trailing,
    this.padding,
  });

  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: PlaneSpacing.md,
            vertical: PlaneSpacing.sm,
          ),
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: PlaneTypography.labelSmall.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
          if (trailing != null) ...[
            const Spacer(),
            trailing!,
          ],
        ],
      ),
    );
  }
}

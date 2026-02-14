import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A consistent list item with leading, title, subtitle, and trailing widgets.
class PlaneListTile extends StatelessWidget {
  const PlaneListTile({
    required this.title,
    super.key,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.showDivider = false,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget tile = Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: PlaneSpacing.md,
            vertical: PlaneSpacing.sm,
          ),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: PlaneSpacing.sm),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  style: PlaneTypography.bodyLarge.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                  child: title,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  DefaultTextStyle(
                    style: PlaneTypography.bodySmall.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    child: subtitle!,
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: PlaneSpacing.sm),
            trailing!,
          ],
        ],
      ),
    );

    if (onTap != null || onLongPress != null) {
      tile = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: tile,
      );
    }

    if (showDivider) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          tile,
          Divider(
            height: 1,
            indent: PlaneSpacing.md,
            endIndent: PlaneSpacing.md,
            color: theme.dividerColor,
          ),
        ],
      );
    }

    return tile;
  }
}

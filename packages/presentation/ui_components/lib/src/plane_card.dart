import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A reusable card widget with elevation, padding, and optional tap handler.
class PlaneCard extends StatelessWidget {
  const PlaneCard({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.elevation = 0,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double elevation;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final resolvedBorderRadius = borderRadius ?? PlaneRadius.md;
    final resolvedColor = color ?? theme.colorScheme.surface;

    Widget card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: resolvedColor,
        borderRadius: resolvedBorderRadius,
        border: borderColor != null
            ? Border.all(color: borderColor!)
            : Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
        boxShadow: elevation > 0 ? PlaneShadows.sm : PlaneShadows.none,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(PlaneSpacing.md),
        child: child,
      ),
    );

    if (onTap != null) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: resolvedBorderRadius,
          child: card,
        ),
      );
    }

    return card;
  }
}

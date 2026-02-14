import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A card displaying a single analytics metric with a large number,
/// a descriptive label, and an optional trend indicator.
class AnalyticsStatCard extends StatelessWidget {
  const AnalyticsStatCard({
    required this.value,
    required this.label,
    this.trend,
    this.trendPositive,
    this.color,
    super.key,
  });

  final String value;
  final String label;

  /// Optional trend text (e.g. "+12%"). Shown with an arrow icon.
  final String? trend;

  /// Whether the trend is positive (green up arrow) or negative (red down).
  /// Defaults to true if [trend] is not null.
  final bool? trendPositive;

  /// Accent color for the card's left border.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final accentColor = color ?? PlaneColors.primary;

    return Container(
      padding: const EdgeInsets.all(PlaneSpacing.md),
      decoration: BoxDecoration(
        color: PlaneColors.white,
        borderRadius: PlaneRadius.lg,
        border: Border.all(color: PlaneColors.grey200),
        boxShadow: PlaneShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 28,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: PlaneRadius.full,
                ),
              ),
              const SizedBox(width: PlaneSpacing.sm),
              Expanded(
                child: Text(
                  value,
                  style: PlaneTypography.headlineMedium.copyWith(
                    color: PlaneColors.grey900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (trend != null)
                _TrendBadge(
                  trend: trend!,
                  positive: trendPositive ?? true,
                ),
            ],
          ),
          const SizedBox(height: PlaneSpacing.xs),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              label,
              style: PlaneTypography.bodySmall.copyWith(
                color: PlaneColors.grey500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendBadge extends StatelessWidget {
  const _TrendBadge({
    required this.trend,
    required this.positive,
  });

  final String trend;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final color = positive ? PlaneColors.success : PlaneColors.error;
    final icon = positive ? Icons.trending_up : Icons.trending_down;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PlaneSpacing.sm,
        vertical: PlaneSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: PlaneRadius.full,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 2),
          Text(
            trend,
            style: PlaneTypography.labelSmall.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A linear progress indicator with a completed/total label.
class CycleProgressBar extends StatelessWidget {
  const CycleProgressBar({
    required this.completed,
    required this.total,
    this.height = 6,
    this.showLabel = true,
    super.key,
  });

  final int completed;
  final int total;
  final double height;
  final bool showLabel;

  double get _progress => total > 0 ? (completed / total).clamp(0.0, 1.0) : 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: PlaneRadius.full,
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: PlaneColors.grey200,
            valueColor: AlwaysStoppedAnimation<Color>(
              _progress >= 1.0 ? PlaneColors.success : PlaneColors.primary,
            ),
            minHeight: height,
          ),
        ),
        if (showLabel) ...[
          const SizedBox(height: PlaneSpacing.xs),
          Text(
            '$completed / $total issues',
            style: PlaneTypography.labelSmall.copyWith(
              color: PlaneColors.grey500,
            ),
          ),
        ],
      ],
    );
  }
}

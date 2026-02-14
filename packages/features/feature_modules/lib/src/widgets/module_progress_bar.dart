import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Linear progress bar showing completed vs total issues in a module.
class ModuleProgressBar extends StatelessWidget {
  const ModuleProgressBar({
    required this.completedIssues,
    required this.totalIssues,
    super.key,
    this.height = 6,
    this.showLabel = true,
  });

  final int completedIssues;
  final int totalIssues;
  final double height;
  final bool showLabel;

  double get _percentage =>
      totalIssues == 0 ? 0.0 : completedIssues / totalIssues;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: PlaneRadius.full,
          child: LinearProgressIndicator(
            value: _percentage,
            minHeight: height,
            backgroundColor: PlaneColors.grey200,
            valueColor:
                const AlwaysStoppedAnimation<Color>(PlaneColors.success),
          ),
        ),
        if (showLabel) ...[
          const SizedBox(height: PlaneSpacing.xs),
          Text(
            '$completedIssues / $totalIssues issues',
            style: PlaneTypography.labelSmall.copyWith(
              color: PlaneColors.grey500,
            ),
          ),
        ],
      ],
    );
  }
}

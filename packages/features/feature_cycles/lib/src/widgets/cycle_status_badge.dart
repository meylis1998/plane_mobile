import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A colored badge widget indicating the cycle's current status.
class CycleStatusBadge extends StatelessWidget {
  const CycleStatusBadge({
    required this.status,
    super.key,
  });

  final CycleStatus status;

  static Color backgroundColor(CycleStatus status) {
    return switch (status) {
      CycleStatus.current => PlaneColors.successLight,
      CycleStatus.upcoming => PlaneColors.infoLight,
      CycleStatus.completed => PlaneColors.grey100,
      CycleStatus.draft => PlaneColors.warningLight,
    };
  }

  static Color foregroundColor(CycleStatus status) {
    return switch (status) {
      CycleStatus.current => PlaneColors.success,
      CycleStatus.upcoming => PlaneColors.info,
      CycleStatus.completed => PlaneColors.grey600,
      CycleStatus.draft => PlaneColors.warning,
    };
  }

  static IconData icon(CycleStatus status) {
    return switch (status) {
      CycleStatus.current => Icons.play_circle_outline,
      CycleStatus.upcoming => Icons.schedule,
      CycleStatus.completed => Icons.check_circle_outline,
      CycleStatus.draft => Icons.edit_outlined,
    };
  }

  static String label(CycleStatus status) {
    return switch (status) {
      CycleStatus.current => 'Active',
      CycleStatus.upcoming => 'Upcoming',
      CycleStatus.completed => 'Completed',
      CycleStatus.draft => 'Draft',
    };
  }

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor(status);
    final fg = foregroundColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PlaneSpacing.sm,
        vertical: PlaneSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: PlaneRadius.sm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon(status), size: 14, color: fg),
          const SizedBox(width: PlaneSpacing.xs),
          Text(
            label(status),
            style: PlaneTypography.labelMedium.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}

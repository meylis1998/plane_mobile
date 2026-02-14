import 'package:feature_modules/src/models/module_status.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Colored badge displaying a module's status.
class ModuleStatusBadge extends StatelessWidget {
  const ModuleStatusBadge({
    required this.status,
    super.key,
  });

  final ModuleStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PlaneSpacing.sm,
        vertical: PlaneSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.15),
        borderRadius: PlaneRadius.sm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            status.icon,
            size: 14,
            color: status.color,
          ),
          const SizedBox(width: PlaneSpacing.xs),
          Text(
            status.label,
            style: PlaneTypography.labelMedium.copyWith(
              color: status.color,
            ),
          ),
        ],
      ),
    );
  }
}

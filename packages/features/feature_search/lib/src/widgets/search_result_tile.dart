import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// A tile displaying a work item search result with project identifier,
/// title, state dot, and priority icon.
class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    required this.workItem,
    this.onTap,
    super.key,
  });

  final WorkItem workItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PlaneSpacing.md,
          vertical: PlaneSpacing.sm + PlaneSpacing.xs,
        ),
        child: Row(
          children: [
            PlaneStateIcon(
              stateGroup: workItem.state.group,
              color: _parseColor(workItem.state.color),
            ),
            const SizedBox(width: PlaneSpacing.sm),
            if (workItem.sequenceId != null) ...[
              Text(
                '${workItem.projectId.substring(0, 3).toUpperCase()}'
                '-${workItem.sequenceId}',
                style: PlaneTypography.labelMedium.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: PlaneSpacing.sm),
            ],
            Expanded(
              child: Text(
                workItem.name,
                style: PlaneTypography.bodyMedium.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: PlaneSpacing.sm),
            PlanePriorityIcon(priority: workItem.priority, size: 16),
          ],
        ),
      ),
    );
  }

  Color? _parseColor(String hex) {
    final cleaned = hex.replaceFirst('#', '');
    if (cleaned.length == 6) {
      final value = int.tryParse('FF$cleaned', radix: 16);
      if (value != null) return Color(value);
    }
    return null;
  }
}

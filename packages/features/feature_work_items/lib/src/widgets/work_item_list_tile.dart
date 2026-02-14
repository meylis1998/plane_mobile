import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class WorkItemListTile extends StatelessWidget {
  const WorkItemListTile({
    required this.workItem,
    this.projectIdentifier,
    this.onTap,
    this.onStateTap,
    this.onPriorityTap,
    super.key,
  });

  final WorkItem workItem;
  final String? projectIdentifier;
  final VoidCallback? onTap;
  final VoidCallback? onStateTap;
  final VoidCallback? onPriorityTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: onStateTap,
              child: StateDot(state: workItem.state),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: onPriorityTap,
              child: PriorityIcon(priority: workItem.priority),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (projectIdentifier != null && workItem.sequenceId != null)
                    Text(
                      '$projectIdentifier-${workItem.sequenceId}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: PlaneColors.textSecondaryLight,
                      ),
                    ),
                  Text(
                    workItem.name,
                    style: theme.textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (workItem.assigneeIds != null &&
                workItem.assigneeIds!.isNotEmpty) ...[
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 12,
                backgroundColor: PlaneColors.grey200,
                child: Text(
                  '${workItem.assigneeIds!.length}',
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

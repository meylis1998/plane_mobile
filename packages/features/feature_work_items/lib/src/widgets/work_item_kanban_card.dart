import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class WorkItemKanbanCard extends StatelessWidget {
  const WorkItemKanbanCard({
    required this.workItem,
    this.projectIdentifier,
    this.onTap,
    super.key,
  });

  final WorkItem workItem;
  final String? projectIdentifier;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (projectIdentifier != null &&
                      workItem.sequenceId != null) ...[
                    Text(
                      '$projectIdentifier-${workItem.sequenceId}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: PlaneColors.textSecondaryLight,
                      ),
                    ),
                    const Spacer(),
                  ],
                  PriorityIcon(priority: workItem.priority, size: 14),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                workItem.name,
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              if (workItem.assigneeIds != null &&
                  workItem.assigneeIds!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Spacer(),
                    ...workItem.assigneeIds!.take(3).map(
                          (_) => Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: PlaneColors.grey200,
                              child: Icon(
                                Icons.person,
                                size: 12,
                                color: PlaneColors.grey500,
                              ),
                            ),
                          ),
                        ),
                    if (workItem.assigneeIds!.length > 3)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          '+${workItem.assigneeIds!.length - 3}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: PlaneColors.grey500,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

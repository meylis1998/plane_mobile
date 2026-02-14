import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SubIssuesList extends StatelessWidget {
  const SubIssuesList({
    required this.subIssues,
    this.projectIdentifier,
    this.onItemTap,
    super.key,
  });

  final List<WorkItem> subIssues;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (subIssues.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'No sub-issues',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: PlaneColors.grey400,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Text(
                'Sub-Issues',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: PlaneColors.grey200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${subIssues.length}',
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
        ...subIssues.map((item) => ListTile(
              leading: StateDot(state: item.state),
              title: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle:
                  projectIdentifier != null && item.sequenceId != null
                      ? Text(
                          '$projectIdentifier-${item.sequenceId}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: PlaneColors.textSecondaryLight,
                          ),
                        )
                      : null,
              trailing: PriorityIcon(priority: item.priority, size: 14),
              onTap: () => onItemTap?.call(item),
              dense: true,
            )),
      ],
    );
  }
}

import 'package:feature_work_items/src/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ActivityFeed extends StatelessWidget {
  const ActivityFeed({
    required this.activities,
    super.key,
  });

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (activities.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'No activity yet',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: PlaneColors.grey400,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 6),
                decoration: const BoxDecoration(
                  color: PlaneColors.grey300,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _buildActivityDescription(activity),
                      style: theme.textTheme.bodyMedium,
                    ),
                    if (activity.createdAt != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          _formatRelativeTime(activity.createdAt!),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: PlaneColors.textSecondaryLight,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static String _buildActivityDescription(Activity activity) {
    if (activity.comment != null && activity.comment!.isNotEmpty) {
      return activity.comment!;
    }
    if (activity.field != null) {
      final verb = activity.verb ?? 'updated';
      return '$verb ${activity.field} from "${activity.oldValue ?? ''}" to "${activity.newValue ?? ''}"';
    }
    return activity.verb ?? 'performed an action';
  }

  static String _formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inDays > 365) return '${diff.inDays ~/ 365}y ago';
    if (diff.inDays > 30) return '${diff.inDays ~/ 30}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'just now';
  }
}

import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    required this.comments,
    this.members = const [],
    super.key,
  });

  final List<Comment> comments;
  final List<Member> members;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (comments.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'No comments yet',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: PlaneColors.grey400,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: PlaneColors.dividerLight),
      itemBuilder: (context, index) {
        final comment = comments[index];
        final author = _findMember(comment.createdById);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: PlaneColors.grey200,
                    child: Text(
                      author?.displayName.isNotEmpty == true
                          ? author!.displayName[0].toUpperCase()
                          : '?',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    author?.displayName ?? 'Unknown',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (comment.createdAt != null)
                    Text(
                      _formatRelativeTime(comment.createdAt!),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: PlaneColors.textSecondaryLight,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                comment.body,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }

  Member? _findMember(String userId) {
    for (final m in members) {
      if (m.userId == userId) return m;
    }
    return null;
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

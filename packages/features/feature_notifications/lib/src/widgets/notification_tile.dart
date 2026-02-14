import 'package:feature_notifications/src/models/plane_notification.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// A list tile that displays a single notification.
class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.notification,
    this.onTap,
    super.key,
  });

  final PlaneNotification notification;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: notification.isRead ? null : PlaneColors.primarySurface,
          border: const Border(
            bottom: BorderSide(color: PlaneColors.grey200),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.senderName ?? 'Plane',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (notification.createdAt != null)
                        Text(
                          _timeAgo(notification.createdAt!),
                          style: const TextStyle(
                            fontSize: 12,
                            color: PlaneColors.grey400,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: notification.isRead
                          ? FontWeight.w400
                          : FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (notification.message.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      notification.message,
                      style: const TextStyle(
                        fontSize: 13,
                        color: PlaneColors.grey500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            if (!notification.isRead) ...[
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 6),
                decoration: const BoxDecoration(
                  color: PlaneColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return PlaneAvatar(
      imageUrl: notification.senderAvatar,
      name: notification.senderName ?? 'Plane',
      size: 36,
    );
  }

  static String _timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    if (diff.inDays < 30) return '${diff.inDays ~/ 7}w';
    return '${diff.inDays ~/ 30}mo';
  }
}

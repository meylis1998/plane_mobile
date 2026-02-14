import 'package:feature_notifications/src/models/notification_filter.dart';
import 'package:feature_notifications/src/models/plane_notification.dart';
import 'package:feature_notifications/src/providers/filtered_notifications_provider.dart';
import 'package:feature_notifications/src/providers/notification_filter_provider.dart';
import 'package:feature_notifications/src/providers/notification_list_provider.dart';
import 'package:feature_notifications/src/providers/notification_mutations_provider.dart';
import 'package:feature_notifications/src/widgets/notification_empty_state.dart';
import 'package:feature_notifications/src/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// The main notification inbox screen with filter tabs, pull-to-refresh,
/// and a "Mark all as read" action.
class NotificationListScreen extends ConsumerWidget {
  const NotificationListScreen({
    required this.workspaceSlug,
    this.onNotificationTap,
    super.key,
  });

  final String workspaceSlug;

  /// Called when a notification is tapped.
  /// Parameters: entityType, entityId.
  final void Function(PlaneNotification notification)? onNotificationTap;

  static const _tabs = NotificationFilter.values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(currentNotificationFilterProvider);
    final asyncNotifications = ref.watch(
      filteredNotificationsProvider(workspaceSlug: workspaceSlug),
    );

    return DefaultTabController(
      length: _tabs.length,
      initialIndex: _tabs.indexOf(currentFilter),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          actions: [
            IconButton(
              icon: const Icon(Icons.done_all_rounded),
              tooltip: 'Mark all as read',
              onPressed: () => _markAllRead(ref),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              ref
                  .read(currentNotificationFilterProvider.notifier)
                  .select(_tabs[index]);
            },
            labelColor: PlaneColors.primary,
            unselectedLabelColor: PlaneColors.grey500,
            indicatorColor: PlaneColors.primary,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Unread'),
              Tab(text: 'Read'),
            ],
          ),
        ),
        body: asyncNotifications.when(
          loading: PlaneLoadingShimmer.list,
          error: (error, stack) => PlaneErrorWidget(
            message: 'Failed to load notifications',
            detail: error.toString(),
            onRetry: () => ref
                .read(
                  notificationListProvider(
                    workspaceSlug: workspaceSlug,
                  ).notifier,
                )
                .refresh(),
          ),
          data: (notifications) {
            if (notifications.isEmpty) {
              return NotificationEmptyState(
                filterLabel: currentFilter == NotificationFilter.all
                    ? null
                    : currentFilter.name,
              );
            }

            return RefreshIndicator(
              onRefresh: () => ref
                  .read(
                    notificationListProvider(
                      workspaceSlug: workspaceSlug,
                    ).notifier,
                  )
                  .refresh(),
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationTile(
                    notification: notification,
                    onTap: () => _onTap(ref, notification),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _onTap(WidgetRef ref, PlaneNotification notification) {
    if (!notification.isRead) {
      ref.read(notificationMutationsProvider.notifier).markRead(
            workspaceSlug: workspaceSlug,
            notificationId: notification.id,
          );
    }
    onNotificationTap?.call(notification);
  }

  void _markAllRead(WidgetRef ref) {
    HapticFeedback.lightImpact();
    ref.read(notificationMutationsProvider.notifier).markAllRead(
          workspaceSlug: workspaceSlug,
        );
  }
}

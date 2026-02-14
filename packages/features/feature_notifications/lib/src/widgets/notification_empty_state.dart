import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

/// Empty state shown when there are no notifications for the current filter.
class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({this.filterLabel, super.key});

  final String? filterLabel;

  @override
  Widget build(BuildContext context) {
    return PlaneEmptyState(
      icon: Icons.notifications_none_rounded,
      title: filterLabel != null
          ? 'No $filterLabel notifications'
          : 'All caught up!',
      message: 'Notifications about your work items, projects, '
          'and cycles will show up here.',
    );
  }
}

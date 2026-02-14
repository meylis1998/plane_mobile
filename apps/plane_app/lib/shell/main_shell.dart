import 'package:core_di/core_di.dart';
import 'package:core_realtime/core_realtime.dart';
import 'package:data_sync/data_sync.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_notifications/feature_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The main shell widget that wraps authenticated screens with a
/// [NavigationBar] for top-level navigation.
class MainShell extends ConsumerWidget {
  const MainShell({required this.child, super.key});

  final Widget child;

  static const _tabs = [
    _TabDefinition(
      label: 'Projects',
      icon: Icons.folder_outlined,
      activeIcon: Icons.folder,
      path: '/home/projects',
    ),
    _TabDefinition(
      label: 'Search',
      icon: Icons.search,
      activeIcon: Icons.search,
      path: '/home/search',
    ),
    _TabDefinition(
      label: 'Notifications',
      icon: Icons.notifications_outlined,
      activeIcon: Icons.notifications,
      path: '/home/notifications',
    ),
    _TabDefinition(
      label: 'Profile',
      icon: Icons.person_outlined,
      activeIcon: Icons.person,
      path: '/home/profile',
    ),
  ];

  int _currentIndex(String location) {
    for (var i = _tabs.length - 1; i >= 0; i--) {
      if (location.startsWith(_tabs[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectedWorkspaceProvider);
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = _currentIndex(location);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          _SyncStatusAction(),
          SizedBox(width: 8),
          ConnectionStatusIndicator(),
          SizedBox(width: 16),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: child,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          context.go(_tabs[index].path);
        },
        destinations: _tabs.map((tab) {
          final icon = Icon(tab.icon);
          final selectedIcon = Icon(tab.activeIcon);

          if (tab.path == '/home/notifications') {
            final workspace = ref.watch(selectedWorkspaceProvider);
            final unread = workspace != null
                ? ref.watch(
                    unreadCountProvider(workspaceSlug: workspace.slug),
                  )
                : 0;
            return NavigationDestination(
              icon: NotificationBadge(count: unread, child: icon),
              selectedIcon:
                  NotificationBadge(count: unread, child: selectedIcon),
              label: tab.label,
            );
          }

          return NavigationDestination(
            icon: icon,
            selectedIcon: selectedIcon,
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}

/// AppBar action that shows a sync status indicator with a pending count badge.
class _SyncStatusAction extends ConsumerWidget {
  const _SyncStatusAction();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncQueueDao = ref.watch(syncQueueDaoProvider);
    final apiClient = ref.watch(planeApiClientProvider);

    final statusAsync = ref.watch(
      syncStatusProvider(dao: syncQueueDao, apiClient: apiClient),
    );
    final pendingAsync = ref.watch(
      pendingSyncCountProvider(dao: syncQueueDao),
    );

    final status = statusAsync.valueOrNull ?? const SyncStatus.idle();
    final pendingCount = pendingAsync.valueOrNull ?? 0;

    return PendingSyncBadge(
      count: pendingCount,
      child: SyncStatusIndicator(status: status),
    );
  }
}

class _TabDefinition {
  const _TabDefinition({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.path,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String path;
}

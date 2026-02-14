import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Profile screen showing user info, current workspace, and logout.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);
    final workspace = ref.watch(selectedWorkspaceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(PlaneSpacing.md),
        children: [
          // User info card
          _UserInfoCard(authState: authState),
          const SizedBox(height: PlaneSpacing.lg),

          // Current workspace
          if (workspace != null) ...[
            const _SectionHeader(title: 'Current Workspace'),
            const SizedBox(height: PlaneSpacing.sm),
            PlaneCard(
              child: ListTile(
                leading: PlaneAvatar(
                  imageUrl: workspace.logo,
                  name: workspace.name,
                ),
                title: Text(workspace.name),
                subtitle: Text(workspace.slug),
                trailing: TextButton(
                  onPressed: () => context.go('/workspace-select'),
                  child: const Text('Switch'),
                ),
              ),
            ),
            const SizedBox(height: PlaneSpacing.lg),
          ],

          // App info
          const _SectionHeader(title: 'About'),
          const SizedBox(height: PlaneSpacing.sm),
          const PlaneCard(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Version'),
                  trailing: Text(
                    '0.1.0',
                    style: TextStyle(color: PlaneColors.grey500),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Plane Mobile'),
                  subtitle: Text('Open-source project management'),
                ),
              ],
            ),
          ),
          const SizedBox(height: PlaneSpacing.xl),

          // Logout button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text(
                      'Are you sure you want to log out?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Cancel'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Log Out'),
                      ),
                    ],
                  ),
                );

                if (confirmed ?? false) {
                  await ref
                      .read(authStateNotifierProvider.notifier)
                      .logout();
                  if (context.mounted) {
                    context.go('/login');
                  }
                }
              },
              icon: const Icon(Icons.logout, color: PlaneColors.error),
              label: const Text(
                'Log Out',
                style: TextStyle(color: PlaneColors.error),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: PlaneColors.error),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard({required this.authState});

  final AuthState authState;

  @override
  Widget build(BuildContext context) {
    return PlaneCard(
      child: Padding(
        padding: const EdgeInsets.all(PlaneSpacing.md),
        child: Row(
          children: [
            const PlaneAvatar(
              name: 'User',
              size: 56,
            ),
            const SizedBox(width: PlaneSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plane User',
                    style: PlaneTypography.titleMedium.copyWith(
                      color: PlaneColors.grey800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    authState.when(
                      unauthenticated: () => 'Not signed in',
                      authenticating: () => 'Signing in...',
                      authenticated: (workspaces) =>
                          '${workspaces.length} workspace(s)',
                      error: (message) => message,
                    ),
                    style: PlaneTypography.bodySmall.copyWith(
                      color: PlaneColors.grey500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: PlaneTypography.titleSmall.copyWith(
        color: PlaneColors.grey600,
      ),
    );
  }
}

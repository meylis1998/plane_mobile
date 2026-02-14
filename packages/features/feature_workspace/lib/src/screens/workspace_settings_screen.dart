import 'package:feature_workspace/src/providers/workspace_detail_provider.dart';
import 'package:feature_workspace/src/widgets/workspace_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// Displays workspace settings: name, slug, member count.
class WorkspaceSettingsScreen extends ConsumerWidget {
  const WorkspaceSettingsScreen({
    required this.workspaceSlug,
    super.key,
  });

  final String workspaceSlug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWorkspace = ref.watch(
      workspaceDetailProvider(slug: workspaceSlug),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Workspace Settings')),
      body: asyncWorkspace.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: PlaneColors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load workspace',
                  style:
                      Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: PlaneColors.grey500,
                  ),
                ),
              ],
            ),
          ),
        ),
        data: (workspace) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: WorkspaceLogo(
                workspace: workspace,
                size: 72,
              ),
            ),
            const SizedBox(height: 24),
            _SettingsTile(
              label: 'Name',
              value: workspace.name,
              icon: Icons.business,
            ),
            const Divider(height: 1),
            _SettingsTile(
              label: 'Slug',
              value: workspace.slug,
              icon: Icons.link,
            ),
            const Divider(height: 1),
            _SettingsTile(
              label: 'Members',
              value:
                  workspace.memberCount?.toString() ?? '--',
              icon: Icons.group,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: PlaneColors.grey500),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          color: PlaneColors.grey500,
        ),
      ),
      subtitle: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}

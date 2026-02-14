import 'package:domain_core/domain_core.dart';
import 'package:feature_auth/src/providers/selected_workspace_provider.dart';
import 'package:feature_auth/src/providers/workspace_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

class WorkspaceSelectionScreen extends ConsumerWidget {
  const WorkspaceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaces = ref.watch(workspaceListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Workspace'),
        centerTitle: true,
      ),
      body: workspaces.isEmpty
          ? const Center(
              child: Text('No workspaces found.'),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              itemCount: workspaces.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final workspace = workspaces[index];
                return _WorkspaceTile(
                  workspace: workspace,
                  onTap: () {
                    ref
                        .read(selectedWorkspaceProvider.notifier)
                        .select(workspace);
                    context.go('/');
                  },
                );
              },
            ),
    );
  }
}

class _WorkspaceTile extends StatelessWidget {
  const _WorkspaceTile({
    required this.workspace,
    required this.onTap,
  });

  final Workspace workspace;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: PlaneColors.borderLight),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: PlaneAvatar(
          imageUrl: workspace.logo,
          name: workspace.name,
        ),
        title: Text(
          workspace.name,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          workspace.slug,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: PlaneColors.textSecondaryLight,
              ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

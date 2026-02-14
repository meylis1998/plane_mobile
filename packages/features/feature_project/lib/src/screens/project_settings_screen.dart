import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_detail_provider.dart';
import 'package:feature_project/src/providers/project_members_provider.dart';
import 'package:feature_project/src/providers/project_mutations_provider.dart';
import 'package:feature_project/src/widgets/project_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// Project settings screen with edit, members list, and archive/delete.
class ProjectSettingsScreen extends ConsumerWidget {
  const ProjectSettingsScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onDeleted,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProject = ref.watch(
      projectDetailProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    final asyncMembers = ref.watch(
      projectMembersProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Project Settings')),
      body: asyncProject.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
        data: (project) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Project info header
            Center(child: ProjectEmoji(emoji: project.emoji, size: 56)),
            const SizedBox(height: 12),
            Center(
              child: Text(
                project.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            if (project.identifier != null) ...[
              const SizedBox(height: 4),
              Center(
                child: Text(
                  project.identifier!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: PlaneColors.grey500,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),

            // General section
            const _SectionTitle(title: 'General'),
            _SettingsTile(
              icon: Icons.edit_outlined,
              title: 'Edit Project',
              subtitle: 'Update name, description, network',
              onTap: () {
                // Navigation handled by the parent
              },
            ),
            const Divider(height: 1),

            // Members section
            const SizedBox(height: 24),
            const _SectionTitle(title: 'Members'),
            asyncMembers.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Failed to load members: $e'),
              ),
              data: (members) {
                if (members.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'No members found.',
                      style: TextStyle(color: PlaneColors.grey500),
                    ),
                  );
                }
                return Column(
                  children: members.map((m) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: PlaneColors.primarySurface,
                        child: Text(
                          m.displayName.isNotEmpty
                              ? m.displayName[0].toUpperCase()
                              : '?',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: PlaneColors.primary,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      title: Text(m.displayName),
                      subtitle: Text(
                        m.role.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            // Danger zone
            const SizedBox(height: 32),
            const _SectionTitle(title: 'Danger Zone'),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _confirmDelete(context, ref, project),
              style: OutlinedButton.styleFrom(
                foregroundColor: PlaneColors.error,
                side: const BorderSide(color: PlaneColors.error),
              ),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete Project'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Project project,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Project'),
        content: Text(
          'Are you sure you want to delete '
          '"${project.name}"? '
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: PlaneColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final success = await ref
        .read(projectMutationsProvider.notifier)
        .deleteProject(
          workspaceSlug: workspaceSlug,
          projectId: projectId,
        );

    if (success) {
      onDeleted?.call();
    }
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: PlaneColors.grey500,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: PlaneColors.grey600),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13, color: PlaneColors.grey500),
      ),
      trailing: const Icon(Icons.chevron_right, color: PlaneColors.grey400),
      onTap: onTap,
    );
  }
}

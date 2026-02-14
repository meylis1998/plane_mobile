import 'package:feature_workspace/src/providers/workspace_members_provider.dart';
import 'package:feature_workspace/src/widgets/member_role_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Lists workspace members with their roles.
class WorkspaceMembersScreen extends ConsumerWidget {
  const WorkspaceMembersScreen({
    required this.workspaceSlug,
    super.key,
  });

  final String workspaceSlug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMembers = ref.watch(
      workspaceMembersProvider(workspaceSlug: workspaceSlug),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Members')),
      body: asyncMembers.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: PlaneColors.error,
              ),
              const SizedBox(height: 12),
              Text(
                'Failed to load members',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              FilledButton.tonal(
                onPressed: () => ref.invalidate(
                  workspaceMembersProvider(
                    workspaceSlug: workspaceSlug,
                  ),
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (members) {
          if (members.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.group_off,
                    size: 48,
                    color: PlaneColors.grey400,
                  ),
                  SizedBox(height: 12),
                  Text('No members found'),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: members.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, indent: 72),
            itemBuilder: (context, index) {
              final member = members[index];
              return ListTile(
                leading: PlaneAvatar(
                  imageUrl: member.avatar,
                  name: member.displayName,
                ),
                title: Text(member.displayName),
                subtitle: Text(
                  member.email,
                  style: const TextStyle(
                    fontSize: 13,
                    color: PlaneColors.grey500,
                  ),
                ),
                trailing: MemberRoleBadge(role: member.role),
              );
            },
          );
        },
      ),
    );
  }
}

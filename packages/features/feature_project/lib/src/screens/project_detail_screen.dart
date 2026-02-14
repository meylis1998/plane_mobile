import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_detail_provider.dart';
import 'package:feature_project/src/widgets/identifier_badge.dart';
import 'package:feature_project/src/widgets/network_badge.dart';
import 'package:feature_project/src/widgets/project_emoji.dart';
import 'package:feature_project/src/widgets/project_stat_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Project detail screen showing header, stats, and
/// navigation to Issues, Cycles, Modules, and Pages.
class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onNavigate,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;

  /// Callback when user taps a navigation section.
  /// Receives one of: 'issues', 'cycles', 'modules',
  /// 'pages', 'settings'.
  final void Function(String section)? onNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProject = ref.watch(
      projectDetailProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );

    return Scaffold(
      body: asyncProject.when(
        loading: PlaneLoadingShimmer.detail,
        error: (error, stack) => PlaneErrorWidget(
          message: 'Failed to load project',
          detail: error.toString(),
          onRetry: () => ref.invalidate(
            projectDetailProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
            ),
          ),
        ),
        data: (project) => _ProjectDetailBody(
          project: project,
          onNavigate: onNavigate,
        ),
      ),
    );
  }
}

class _ProjectDetailBody extends StatelessWidget {
  const _ProjectDetailBody({
    required this.project,
    this.onNavigate,
  });

  final Project project;
  final void Function(String section)? onNavigate;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 160,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              project.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            background: project.coverImage != null
                ? PlaneNetworkImage(
                    imageUrl: project.coverImage!,
                    errorWidget: const _GradientBackground(),
                  )
                : const _GradientBackground(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () =>
                  onNavigate?.call('settings'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ProjectEmoji(
                      emoji: project.emoji,
                      size: 40,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          if (project.identifier != null)
                            IdentifierBadge(
                              identifier:
                                  project.identifier!,
                            ),
                          if (project.description != null &&
                              project.description!
                                  .isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              project.description!,
                              style: const TextStyle(
                                fontSize: 14,
                                color:
                                    PlaneColors.grey600,
                              ),
                              maxLines: 2,
                              overflow:
                                  TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _StatsRow(project: project),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _NavigationTile(
              icon: Icons.list_alt,
              title: 'Issues',
              subtitle: 'View and manage work items',
              onTap: () => onNavigate?.call('issues'),
            ),
            _NavigationTile(
              icon: Icons.loop,
              title: 'Cycles',
              subtitle: 'Sprint planning and tracking',
              onTap: () => onNavigate?.call('cycles'),
            ),
            _NavigationTile(
              icon: Icons.view_module_outlined,
              title: 'Modules',
              subtitle: 'Group related issues',
              onTap: () => onNavigate?.call('modules'),
            ),
            _NavigationTile(
              icon: Icons.article_outlined,
              title: 'Pages',
              subtitle: 'Project documentation',
              onTap: () => onNavigate?.call('pages'),
            ),
            _NavigationTile(
              icon: Icons.bar_chart,
              title: 'Analytics',
              subtitle: 'Project insights and charts',
              onTap: () => onNavigate?.call('analytics'),
            ),
            _NavigationTile(
              icon: Icons.people_outline,
              title: 'Workload',
              subtitle: 'Team workload distribution',
              onTap: () => onNavigate?.call('workload'),
            ),
          ]),
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final statesLen = project.states?.length ?? 0;
    final labelsLen = project.labels?.length ?? 0;
    return Row(
      children: [
        ProjectStatChip(
          icon: Icons.layers_outlined,
          label: '$statesLen states',
        ),
        const SizedBox(width: 8),
        ProjectStatChip(
          icon: Icons.label_outline,
          label: '$labelsLen labels',
        ),
        const SizedBox(width: 8),
        if (project.network != null)
          NetworkBadge(network: project.network!),
      ],
    );
  }
}

class _GradientBackground extends StatelessWidget {
  const _GradientBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PlaneColors.primary,
            PlaneColors.primaryDark,
          ],
        ),
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({
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
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: PlaneColors.grey50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: PlaneColors.grey700,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13,
          color: PlaneColors.grey500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: PlaneColors.grey400,
      ),
      onTap: onTap,
    );
  }
}

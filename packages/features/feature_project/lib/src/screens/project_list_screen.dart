import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_list_provider.dart';
import 'package:feature_project/src/providers/project_mutations_provider.dart';
import 'package:feature_project/src/providers/project_search_provider.dart';
import 'package:feature_project/src/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// The main project list screen with search, favorites section,
/// pull-to-refresh, and a FAB to create new projects.
class ProjectListScreen extends ConsumerStatefulWidget {
  const ProjectListScreen({
    required this.workspaceSlug,
    this.onProjectTap,
    this.onCreateTap,
    super.key,
  });

  final String workspaceSlug;
  final void Function(Project project)? onProjectTap;
  final VoidCallback? onCreateTap;

  @override
  ConsumerState<ProjectListScreen> createState() =>
      _ProjectListScreenState();
}

class _ProjectListScreenState
    extends ConsumerState<ProjectListScreen> {
  final _searchController = TextEditingController();
  bool _showSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncProjects = ref.watch(
      filteredProjectsProvider(
        workspaceSlug: widget.workspaceSlug,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search projects...',
                  border: InputBorder.none,
                ),
                onChanged: (query) {
                  ref
                      .read(
                        projectSearchQueryProvider.notifier,
                      )
                      .update(query);
                },
              )
            : const Text('Projects'),
        actions: [
          IconButton(
            icon: Icon(
              _showSearch ? Icons.close : Icons.search,
            ),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  _searchController.clear();
                  ref
                      .read(
                        projectSearchQueryProvider.notifier,
                      )
                      .clear();
                }
              });
            },
          ),
        ],
      ),
      body: asyncProjects.when(
        loading: PlaneLoadingShimmer.cardList,
        error: (error, stack) => PlaneErrorWidget(
          message: 'Failed to load projects',
          detail: error.toString(),
          onRetry: () => ref
              .read(
                projectListProvider(
                  workspaceSlug: widget.workspaceSlug,
                ).notifier,
              )
              .refresh(),
        ),
        data: (projects) {
          if (projects.isEmpty) {
            return PlaneEmptyState(
              icon: _showSearch
                  ? Icons.search_off
                  : Icons.folder_outlined,
              title: _showSearch
                  ? 'No matching projects'
                  : 'No projects yet',
              message: _showSearch
                  ? null
                  : 'Create your first project to get started.',
              actionLabel: _showSearch ? null : 'Create Project',
              onAction: _showSearch ? null : widget.onCreateTap,
            );
          }

          final favorites =
              projects.where((p) => p.isFavorite).toList();
          final others =
              projects.where((p) => !p.isFavorite).toList();

          return RefreshIndicator(
            onRefresh: () => ref
                .read(
                  projectListProvider(
                    workspaceSlug: widget.workspaceSlug,
                  ).notifier,
                )
                .refresh(),
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.only(top: 8),
                ),
                if (favorites.isNotEmpty) ...[
                  const SliverToBoxAdapter(
                    child: PlaneSectionHeader(title: 'Favorites'),
                  ),
                  SliverList.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) =>
                        _buildProjectCard(favorites[index]),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 12),
                  ),
                ],
                if (others.isNotEmpty) ...[
                  if (favorites.isNotEmpty)
                    const SliverToBoxAdapter(
                      child: PlaneSectionHeader(
                        title: 'All Projects',
                      ),
                    ),
                  SliverList.builder(
                    itemCount: others.length,
                    itemBuilder: (context, index) =>
                        _buildProjectCard(others[index]),
                  ),
                ],
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 80),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onCreateTap,
        backgroundColor: PlaneColors.primary,
        child: const Icon(
          Icons.add,
          color: PlaneColors.white,
        ),
      ),
    );
  }

  Widget _buildProjectCard(Project project) {
    return ProjectCard(
      project: project,
      onTap: () => widget.onProjectTap?.call(project),
      onFavoriteTap: () {
        HapticFeedback.lightImpact();
        ref
            .read(projectMutationsProvider.notifier)
            .toggleFavorite(
              workspaceSlug: widget.workspaceSlug,
              project: project,
            );
      },
    );
  }
}

import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_search_provider.g.dart';

/// Holds the current search query for the project list.
@riverpod
class ProjectSearchQuery extends _$ProjectSearchQuery {
  @override
  String build() => '';

  // ignore: use_setters_to_change_properties
  void update(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

/// Returns a filtered project list based on the search query.
@riverpod
Future<List<Project>> filteredProjects(
  Ref ref, {
  required String workspaceSlug,
}) async {
  final query = ref.watch(projectSearchQueryProvider).toLowerCase();
  final projects = await ref.watch(
    projectListProvider(workspaceSlug: workspaceSlug).future,
  );

  if (query.isEmpty) return projects;

  return projects.where((p) {
    final nameMatch = p.name.toLowerCase().contains(query);
    final idMatch = p.identifier?.toLowerCase().contains(query) ?? false;
    return nameMatch || idMatch;
  }).toList();
}

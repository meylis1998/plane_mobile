import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_search/src/providers/search_filter_provider.dart';
import 'package:feature_search/src/providers/search_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_results_provider.g.dart';

/// Fetches search results from the API for the given workspace and query.
@riverpod
Future<List<WorkItem>> searchResults(
  Ref ref, {
  required String workspaceSlug,
  required String query,
}) async {
  if (query.trim().isEmpty) return [];

  final repository = ref.watch(searchWorkItemRepositoryProvider);
  final result = await repository.search(
    workspaceSlug: workspaceSlug,
    query: query,
  );

  final items = result.fold(
    (Failure failure) => throw Exception(failure.message),
    (List<WorkItem> items) => items,
  );

  final projectFilter = ref.watch(searchFilterProvider);
  if (projectFilter == null) return items;

  return items.where((item) => item.projectId == projectFilter).toList();
}

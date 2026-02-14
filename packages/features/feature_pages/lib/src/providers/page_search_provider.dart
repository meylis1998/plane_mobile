import 'package:domain_core/domain_core.dart';
import 'package:feature_pages/src/providers/page_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_search_provider.g.dart';

/// Holds the current search query for the page list.
@riverpod
class PageSearchQuery extends _$PageSearchQuery {
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

/// Returns a filtered page list based on the search query.
@riverpod
Future<List<Page>> filteredPages(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final query = ref.watch(pageSearchQueryProvider).toLowerCase();
  final pages = await ref.watch(
    pageListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ).future,
  );

  if (query.isEmpty) return pages;

  return pages.where((p) {
    return p.name.toLowerCase().contains(query);
  }).toList();
}

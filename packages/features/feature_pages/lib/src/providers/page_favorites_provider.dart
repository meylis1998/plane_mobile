import 'package:domain_core/domain_core.dart';
import 'package:feature_pages/src/providers/page_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_favorites_provider.g.dart';

/// Filters pages to only show favorites.
@riverpod
Future<List<Page>> pageFavorites(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final pages = await ref.watch(
    pageListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ).future,
  );

  return pages.where((page) => page.isFavorite).toList();
}

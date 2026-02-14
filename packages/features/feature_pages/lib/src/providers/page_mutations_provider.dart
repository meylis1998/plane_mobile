import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_pages/src/providers/page_favorites_provider.dart';
import 'package:feature_pages/src/providers/page_list_provider.dart';
import 'package:feature_pages/src/providers/page_repository_provider.dart';
import 'package:feature_pages/src/providers/page_tree_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_mutations_provider.g.dart';

@riverpod
class PageMutations extends _$PageMutations {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  /// Creates a new page.
  Future<Page?> createPage({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(pageRepositoryProvider);
    final result = await repository.create(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      page: page,
    );

    return result.fold(
      (Failure failure) {
        state = AsyncError(failure, StackTrace.current);
        return null;
      },
      (Page created) {
        state = const AsyncData(null);
        _invalidateLists(workspaceSlug: workspaceSlug, projectId: projectId);
        return created;
      },
    );
  }

  /// Updates an existing page.
  Future<Page?> updatePage({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(pageRepositoryProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      page: page,
    );

    return result.fold(
      (Failure failure) {
        state = AsyncError(failure, StackTrace.current);
        return null;
      },
      (Page updated) {
        state = const AsyncData(null);
        _invalidateLists(workspaceSlug: workspaceSlug, projectId: projectId);
        return updated;
      },
    );
  }

  /// Deletes a page.
  Future<bool> deletePage({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(pageRepositoryProvider);
    final result = await repository.delete(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      pageId: pageId,
    );

    return result.fold(
      (Failure failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        _invalidateLists(workspaceSlug: workspaceSlug, projectId: projectId);
        return true;
      },
    );
  }

  /// Toggles the favorite status of a page.
  Future<void> toggleFavorite({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  }) async {
    final toggled = page.copyWith(isFavorite: !page.isFavorite);
    final repository = ref.read(pageRepositoryProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      page: toggled,
    );

    result.fold(
      (_) {}, // No-op on failure
      (_) => _invalidateLists(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
  }

  /// Toggles the access between public and private.
  Future<void> toggleAccess({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  }) async {
    final newAccess = page.access == PageAccess.public_
        ? PageAccess.private_
        : PageAccess.public_;
    final toggled = page.copyWith(access: newAccess);
    final repository = ref.read(pageRepositoryProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      page: toggled,
    );

    result.fold(
      (_) {},
      (_) => _invalidateLists(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
  }

  void _invalidateLists({
    required String workspaceSlug,
    required String projectId,
  }) {
    ref
      ..invalidate(
        pageListProvider(
          workspaceSlug: workspaceSlug,
          projectId: projectId,
        ),
      )
      ..invalidate(
        pageTreeProvider(
          workspaceSlug: workspaceSlug,
          projectId: projectId,
        ),
      )
      ..invalidate(
        pageFavoritesProvider(
          workspaceSlug: workspaceSlug,
          projectId: projectId,
        ),
      );
  }
}

import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_pages/src/providers/page_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_list_provider.g.dart';

@riverpod
class PageList extends _$PageList {
  @override
  Future<List<Page>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.watch(pageRepositoryProvider);
    final result = await repository.getAll(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
    return result.fold(
      (Failure failure) => throw Exception(failure.message),
      (List<Page> pages) => pages,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

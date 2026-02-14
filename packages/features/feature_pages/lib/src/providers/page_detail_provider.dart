import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_pages/src/providers/page_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_detail_provider.g.dart';

@riverpod
Future<Page> pageDetail(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String pageId,
}) async {
  final repository = ref.watch(pageRepositoryProvider);
  final result = await repository.getById(
    workspaceSlug: workspaceSlug,
    projectId: projectId,
    pageId: pageId,
  );
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (Page page) => page,
  );
}

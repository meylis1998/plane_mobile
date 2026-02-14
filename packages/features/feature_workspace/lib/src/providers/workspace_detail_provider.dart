import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_workspace/src/providers/workspace_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspace_detail_provider.g.dart';

@riverpod
Future<Workspace> workspaceDetail(
  Ref ref, {
  required String slug,
}) async {
  final repository = ref.watch(workspaceRepositoryProvider);
  final result = await repository.getBySlug(slug: slug);
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (Workspace workspace) => workspace,
  );
}

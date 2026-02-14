import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_provider.g.dart';

@riverpod
Future<Project> projectDetail(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final repository = ref.watch(projectRepositoryProvider);
  final result = await repository.getById(
    workspaceSlug: workspaceSlug,
    projectId: projectId,
  );
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (Project project) => project,
  );
}

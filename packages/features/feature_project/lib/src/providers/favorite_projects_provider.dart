import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_projects_provider.g.dart';

@riverpod
Future<List<Project>> favoriteProjects(
  Ref ref, {
  required String workspaceSlug,
}) async {
  final repository = ref.watch(projectRepositoryProvider);
  final result = await repository.getFavorites(workspaceSlug: workspaceSlug);
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (List<Project> projects) => projects,
  );
}

import 'package:feature_modules/src/providers/module_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_progress_provider.g.dart';

/// Progress stats for a module.
class ModuleProgress {
  const ModuleProgress({
    required this.totalIssues,
    required this.completedIssues,
  });

  final int totalIssues;
  final int completedIssues;

  double get percentage =>
      totalIssues == 0 ? 0.0 : completedIssues / totalIssues;
}

@riverpod
Future<ModuleProgress> moduleProgress(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String moduleId,
}) async {
  final module = await ref.watch(
    moduleDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      moduleId: moduleId,
    ).future,
  );

  return ModuleProgress(
    totalIssues: module.totalIssues ?? 0,
    completedIssues: module.completedIssues ?? 0,
  );
}

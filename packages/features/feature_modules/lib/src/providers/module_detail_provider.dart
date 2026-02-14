import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/providers/module_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_detail_provider.g.dart';

@riverpod
Future<Module> moduleDetail(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String moduleId,
}) async {
  final repository = ref.watch(moduleRepositoryProvider);
  final result = await repository.getById(
    workspaceSlug: workspaceSlug,
    projectId: projectId,
    moduleId: moduleId,
  );
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (Module module) => module,
  );
}

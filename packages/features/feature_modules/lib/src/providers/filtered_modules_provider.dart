import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/models/module_status.dart';
import 'package:feature_modules/src/providers/module_filter_provider.dart';
import 'package:feature_modules/src/providers/module_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_modules_provider.g.dart';

@riverpod
Future<List<Module>> filteredModules(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final filter = ref.watch(moduleFilterNotifierProvider);
  final modules = await ref.watch(
    moduleListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ).future,
  );

  if (filter.isEmpty) return modules;

  return modules.where((module) {
    if (filter.statuses.isNotEmpty) {
      final moduleStatus = ModuleStatus.fromString(module.status);
      if (moduleStatus == null || !filter.statuses.contains(moduleStatus)) {
        return false;
      }
    }
    return true;
  }).toList();
}

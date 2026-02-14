import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_filter_provider.dart';
import 'package:feature_cycles/src/providers/cycle_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_cycles_provider.g.dart';

@riverpod
Future<List<Cycle>> filteredCycles(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final filter = ref.watch(cycleFilterNotifierProvider);
  final cycles = await ref.watch(
    cycleListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ).future,
  );

  if (filter.isEmpty) return cycles;

  return cycles.where((cycle) {
    if (filter.status != null && cycle.status != filter.status) {
      return false;
    }
    return true;
  }).toList();
}

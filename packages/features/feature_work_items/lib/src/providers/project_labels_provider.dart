import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/project_states_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_labels_provider.g.dart';

@riverpod
class ProjectLabelsNotifier extends _$ProjectLabelsNotifier {
  @override
  Future<List<Label>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.watch(projectRepositoryNotifierProvider);
    final result = await repository.getById(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
    return result.fold(
      (failure) => throw failure,
      (project) => project.labels ?? [],
    );
  }
}

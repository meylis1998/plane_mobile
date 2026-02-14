import 'package:feature_work_items/src/models/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_activity_provider.g.dart';

@riverpod
class WorkItemActivity extends _$WorkItemActivity {
  @override
  Future<List<Activity>> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    final repository = ref.watch(activityRepositoryNotifierProvider);
    return repository.getActivities(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

/// Abstract interface for activity data fetching.
abstract class ActivityRepository {
  Future<List<Activity>> getActivities({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });
}

/// Provider for the activity repository.
/// Must be overridden at the app level with a concrete implementation.
@Riverpod(keepAlive: true)
class ActivityRepositoryNotifier extends _$ActivityRepositoryNotifier {
  @override
  ActivityRepository build() {
    throw UnimplementedError(
      'activityRepositoryNotifierProvider must be overridden',
    );
  }
}

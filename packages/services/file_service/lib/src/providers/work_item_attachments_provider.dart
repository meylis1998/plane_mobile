import 'package:domain_core/domain_core.dart';
import 'package:file_service/src/providers/file_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_attachments_provider.g.dart';

/// Fetches and caches the list of attachments for a given work item.
@riverpod
class WorkItemAttachments extends _$WorkItemAttachments {
  @override
  Future<List<Attachment>> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    final service = ref.watch(fileServiceProvider);
    final result = await service.getAttachments(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
    return result.fold(
      (failure) => throw failure,
      (attachments) => attachments,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

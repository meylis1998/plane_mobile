import 'dart:io';

import 'package:file_service/src/models/upload_progress.dart';
import 'package:file_service/src/providers/file_service_provider.dart';
import 'package:file_service/src/providers/work_item_attachments_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_attachment_provider.g.dart';

/// Manages file upload state with progress tracking.
@riverpod
class UploadAttachment extends _$UploadAttachment {
  @override
  UploadProgress? build() => null;

  /// Uploads a [file] as an attachment and reports progress.
  Future<void> upload({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required File file,
  }) async {
    final fileName = file.path.split(Platform.pathSeparator).last;
    state = UploadProgress(fileName: fileName);

    final service = ref.read(fileServiceProvider);
    final result = await service.uploadAttachment(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
      file: file,
      onSendProgress: (sent, total) {
        if (total > 0) {
          state = UploadProgress(
            fileName: fileName,
            progress: sent / total,
          );
        }
      },
    );

    result.fold(
      (failure) {
        state = UploadProgress(
          fileName: fileName,
          error: failure.message,
        );
      },
      (_) {
        state = UploadProgress(
          fileName: fileName,
          progress: 1,
          isComplete: true,
        );
        // Refresh the attachment list after a successful upload.
        ref.invalidate(
          workItemAttachmentsProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
            workItemId: workItemId,
          ),
        );
      },
    );
  }

  void reset() {
    state = null;
  }
}

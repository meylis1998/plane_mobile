import 'package:file_service/src/models/upload_progress.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Shows a linear progress bar with file name and optional error state.
class UploadProgressIndicator extends StatelessWidget {
  const UploadProgressIndicator({
    required this.progress,
    this.onCancel,
    super.key,
  });

  final UploadProgress progress;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = progress.error != null;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: hasError ? PlaneColors.errorLight : PlaneColors.primarySurface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                hasError ? Icons.error_outline : Icons.upload_file,
                size: 18,
                color: hasError ? PlaneColors.error : PlaneColors.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  progress.fileName,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (!progress.isComplete && onCancel != null)
                GestureDetector(
                  onTap: onCancel,
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: PlaneColors.grey500,
                  ),
                ),
              if (progress.isComplete)
                const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: PlaneColors.success,
                ),
            ],
          ),
          if (hasError) ...[
            const SizedBox(height: 4),
            Text(
              progress.error!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: PlaneColors.error,
              ),
            ),
          ] else ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress.progress,
                minHeight: 4,
                backgroundColor: PlaneColors.grey200,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(PlaneColors.primary),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              progress.isComplete
                  ? 'Complete'
                  : '${(progress.progress * 100).toInt()}%',
              style: theme.textTheme.bodySmall?.copyWith(
                color: PlaneColors.textSecondaryLight,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

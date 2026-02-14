import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Card for a single attachment with file icon and metadata.
/// Shows a thumbnail icon for image file types.
class AttachmentCard extends StatelessWidget {
  const AttachmentCard({
    required this.attachment,
    this.onTap,
    this.onDelete,
    super.key,
  });

  final Attachment attachment;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isImage = _isImageFile(attachment.fileName);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: PlaneColors.borderLight),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isImage
                    ? PlaneColors.infoLight
                    : PlaneColors.surfaceVariantLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isImage ? Icons.image_outlined : _fileIcon(attachment.fileName),
                size: 20,
                color: isImage ? PlaneColors.info : PlaneColors.grey500,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attachment.fileName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (attachment.fileSize != null)
                    Text(
                      _formatFileSize(attachment.fileSize!),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: PlaneColors.textSecondaryLight,
                      ),
                    ),
                ],
              ),
            ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 20),
                color: PlaneColors.grey400,
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }

  static bool _isImageFile(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    return {'png', 'jpg', 'jpeg', 'gif', 'webp', 'svg', 'bmp'}
        .contains(ext);
  }

  static IconData _fileIcon(String fileName) {
    final ext = fileName.split('.').last.toLowerCase();
    return switch (ext) {
      'pdf' => Icons.picture_as_pdf,
      'doc' || 'docx' => Icons.description,
      'xls' || 'xlsx' => Icons.table_chart,
      'ppt' || 'pptx' => Icons.slideshow,
      'zip' || 'rar' || '7z' => Icons.folder_zip,
      'mp4' || 'mov' || 'avi' => Icons.videocam,
      'mp3' || 'wav' || 'aac' => Icons.audiotrack,
      _ => Icons.insert_drive_file,
    };
  }

  static String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}

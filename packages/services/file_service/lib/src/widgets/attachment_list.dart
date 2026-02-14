import 'package:domain_core/domain_core.dart';
import 'package:file_service/src/widgets/attachment_card.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A list of attachment cards with file icon, name, size,
/// and download/delete actions.
class AttachmentList extends StatelessWidget {
  const AttachmentList({
    required this.attachments,
    this.onTap,
    this.onDelete,
    super.key,
  });

  final List<Attachment> attachments;
  final void Function(Attachment attachment)? onTap;
  final void Function(Attachment attachment)? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (attachments.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'No attachments',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: PlaneColors.grey400,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: attachments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final attachment = attachments[index];
        return AttachmentCard(
          attachment: attachment,
          onTap: onTap != null ? () => onTap!(attachment) : null,
          onDelete: onDelete != null ? () => onDelete!(attachment) : null,
        );
      },
    );
  }
}

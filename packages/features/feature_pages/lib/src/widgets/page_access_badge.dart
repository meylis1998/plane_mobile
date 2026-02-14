import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A small badge that indicates whether the page is public or private.
class PageAccessBadge extends StatelessWidget {
  const PageAccessBadge({required this.access, super.key});

  final PageAccess access;

  @override
  Widget build(BuildContext context) {
    final isPublic = access == PageAccess.public_;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isPublic ? Icons.public : Icons.lock_outline,
          size: 14,
          color: isPublic ? PlaneColors.info : PlaneColors.warning,
        ),
        const SizedBox(width: 4),
        Text(
          isPublic ? 'Public' : 'Private',
          style: TextStyle(
            fontSize: 12,
            color: isPublic ? PlaneColors.info : PlaneColors.warning,
          ),
        ),
      ],
    );
  }
}

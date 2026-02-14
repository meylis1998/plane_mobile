import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A badge overlay that shows an unread notification count.
///
/// Wraps a [child] widget (typically a bottom-nav icon) and displays a
/// small red badge with [count] when the count is greater than zero.
class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    required this.child,
    required this.count,
    super.key,
  });

  final Widget child;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            right: -6,
            top: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              decoration: BoxDecoration(
                color: PlaneColors.error,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  count > 99 ? '99+' : '$count',
                  style: const TextStyle(
                    color: PlaneColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

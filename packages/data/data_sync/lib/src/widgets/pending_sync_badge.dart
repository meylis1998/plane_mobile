import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A small badge that displays the number of pending sync operations.
///
/// Hides itself when [count] is zero.
class PendingSyncBadge extends StatelessWidget {
  const PendingSyncBadge({
    required this.count,
    this.child,
    super.key,
  });

  final int count;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (count == 0 && child != null) return child!;
    if (count == 0) return const SizedBox.shrink();

    final badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: PlaneColors.warning,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
      child: Text(
        count > 99 ? '99+' : '$count',
        style: const TextStyle(
          color: PlaneColors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );

    if (child == null) return badge;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child!,
        Positioned(
          right: -6,
          top: -4,
          child: badge,
        ),
      ],
    );
  }
}

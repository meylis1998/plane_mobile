import 'package:core_realtime/src/events/plane_event.dart';
import 'package:core_realtime/src/providers/realtime_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Displays the number of online users in a workspace.
class PresenceIndicator extends ConsumerWidget {
  const PresenceIndicator({
    required this.workspaceSlug,
    super.key,
  });

  /// The workspace to show presence for.
  final String workspaceSlug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenceMap = ref.watch(
      presenceProvider(workspaceSlug: workspaceSlug),
    );

    final onlineCount = presenceMap.values
        .where((s) => s == PresenceStatus.online)
        .length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: onlineCount > 0
                ? const Color(0xFF4CAF50)
                : const Color(0xFF9E9E9E),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$onlineCount online',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

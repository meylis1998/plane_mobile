import 'package:data_sync/src/models/sync_conflict.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Callback invoked when the user picks a resolution.
///
/// [keepLocal] is `true` if the user chose the local version, `false` for
/// the server version.
typedef ConflictResolutionCallback = void Function({
  required SyncConflict conflict,
  required bool keepLocal,
});

/// A bottom sheet that presents local and server data side-by-side so the
/// user can choose which version to keep.
class ConflictResolutionSheet extends StatelessWidget {
  const ConflictResolutionSheet({
    required this.conflict,
    required this.onResolved,
    super.key,
  });

  final SyncConflict conflict;
  final ConflictResolutionCallback onResolved;

  /// Shows this sheet as a modal bottom sheet.
  static Future<void> show(
    BuildContext context, {
    required SyncConflict conflict,
    required ConflictResolutionCallback onResolved,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => ConflictResolutionSheet(
        conflict: conflict,
        onResolved: onResolved,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: PlaneColors.grey300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Resolve Conflict',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${conflict.entityType} has conflicting changes',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: PlaneColors.grey500,
                    ),
              ),
              const SizedBox(height: 16),
              // Data comparison
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    const _SectionHeader(title: 'Local Version'),
                    _DataCard(data: conflict.localData),
                    const SizedBox(height: 12),
                    const _SectionHeader(title: 'Server Version'),
                    _DataCard(data: conflict.serverData),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        onResolved(conflict: conflict, keepLocal: true);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Keep Local'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        onResolved(conflict: conflict, keepLocal: false);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Keep Server'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard({required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PlaneColors.grey50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PlaneColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    entry.key,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: PlaneColors.grey500,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${entry.value}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

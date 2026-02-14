import 'package:data_sync/src/models/sync_status.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A compact icon widget that reflects the current [SyncStatus].
///
/// - **idle**: green check icon
/// - **syncing**: animated circular progress indicator
/// - **error**: amber warning icon
/// - **completed**: green check icon
class SyncStatusIndicator extends StatelessWidget {
  const SyncStatusIndicator({
    required this.status,
    this.size = 20,
    super.key,
  });

  final SyncStatus status;
  final double size;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      SyncStatusIdle() => Icon(
          Icons.check_circle_outline,
          size: size,
          color: PlaneColors.success,
        ),
      SyncStatusSyncing(:final progress) => SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: progress > 0 ? progress : null,
            strokeWidth: 2,
            color: PlaneColors.primary,
          ),
        ),
      SyncStatusError() => Icon(
          Icons.warning_amber_rounded,
          size: size,
          color: PlaneColors.warning,
        ),
      SyncStatusCompleted() => Icon(
          Icons.check_circle,
          size: size,
          color: PlaneColors.success,
        ),
    };
  }
}

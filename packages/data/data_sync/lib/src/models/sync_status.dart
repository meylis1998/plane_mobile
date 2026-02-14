import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_status.freezed.dart';

@freezed
sealed class SyncStatus with _$SyncStatus {
  const factory SyncStatus.idle() = SyncStatusIdle;
  const factory SyncStatus.syncing({@Default(0.0) double progress}) =
      SyncStatusSyncing;
  const factory SyncStatus.error({required String message}) = SyncStatusError;
  const factory SyncStatus.completed({@Default(0) int syncedCount}) =
      SyncStatusCompleted;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_conflict.freezed.dart';
part 'sync_conflict.g.dart';

@freezed
class SyncConflict with _$SyncConflict {
  const factory SyncConflict({
    required String id,
    required String entityType,
    required String entityId,
    required Map<String, dynamic> localData,
    required Map<String, dynamic> serverData,
    required DateTime detectedAt,
  }) = _SyncConflict;

  factory SyncConflict.fromJson(Map<String, dynamic> json) =>
      _$SyncConflictFromJson(json);
}

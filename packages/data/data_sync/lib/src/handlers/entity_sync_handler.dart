import 'package:core_foundation/core_foundation.dart';

/// Abstract base class for syncing a specific entity type.
///
/// Each entity (work item, project, cycle, etc.) has its own handler
/// that knows how to call the correct API endpoints and update the
/// local database after a successful sync.
abstract class EntitySyncHandler {
  /// The entity type string that this handler is responsible for.
  String get entityType;

  /// Syncs a create operation for [payload] to the server.
  FutureVoid syncCreate(Map<String, dynamic> payload);

  /// Syncs an update operation for [payload] to the server.
  FutureVoid syncUpdate(Map<String, dynamic> payload);

  /// Syncs a delete operation for [payload] to the server.
  FutureVoid syncDelete(Map<String, dynamic> payload);
}

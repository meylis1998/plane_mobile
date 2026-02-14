import 'package:freezed_annotation/freezed_annotation.dart';

part 'plane_event.freezed.dart';
part 'plane_event.g.dart';

/// Sealed class hierarchy representing all real-time events from the server.
@Freezed(toJson: false)
sealed class PlaneEvent with _$PlaneEvent {
  /// A work item was created.
  const factory PlaneEvent.workItemCreated({
    required String workItemId,
    required String projectId,
    required String workspaceSlug,
    required Map<String, dynamic> data,
  }) = WorkItemCreated;

  /// A work item was updated.
  const factory PlaneEvent.workItemUpdated({
    required String workItemId,
    required String projectId,
    required String workspaceSlug,
    required Map<String, dynamic> data,
  }) = WorkItemUpdated;

  /// A work item was deleted.
  const factory PlaneEvent.workItemDeleted({
    required String workItemId,
    required String projectId,
    required String workspaceSlug,
  }) = WorkItemDeleted;

  /// A comment was added to a work item.
  const factory PlaneEvent.commentAdded({
    required String commentId,
    required String workItemId,
    required String projectId,
    required Map<String, dynamic> data,
  }) = CommentAdded;

  /// A work item's state was changed.
  const factory PlaneEvent.stateChanged({
    required String workItemId,
    required String projectId,
    required String oldStateId,
    required String newStateId,
  }) = StateChanged;

  /// A work item's assignees were changed.
  const factory PlaneEvent.assigneeChanged({
    required String workItemId,
    required String projectId,
    required List<String> assigneeIds,
  }) = AssigneeChanged;

  /// A cycle was updated.
  const factory PlaneEvent.cycleUpdated({
    required String cycleId,
    required String projectId,
    required Map<String, dynamic> data,
  }) = CycleUpdated;

  /// A user's presence status changed.
  const factory PlaneEvent.presenceUpdate({
    required String userId,
    required String workspaceSlug,
    required PresenceStatus status,
  }) = PresenceUpdate;

  factory PlaneEvent.fromJson(Map<String, dynamic> json) =>
      _$PlaneEventFromJson(json);
}

/// The online presence status of a user.
enum PresenceStatus {
  @JsonValue('online')
  online,
  @JsonValue('away')
  away,
  @JsonValue('offline')
  offline,
}

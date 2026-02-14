// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkItemCreatedImpl _$$WorkItemCreatedImplFromJson(
  Map<String, dynamic> json,
) => _$WorkItemCreatedImpl(
  workItemId: json['workItemId'] as String,
  projectId: json['projectId'] as String,
  workspaceSlug: json['workspaceSlug'] as String,
  data: json['data'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

_$WorkItemUpdatedImpl _$$WorkItemUpdatedImplFromJson(
  Map<String, dynamic> json,
) => _$WorkItemUpdatedImpl(
  workItemId: json['workItemId'] as String,
  projectId: json['projectId'] as String,
  workspaceSlug: json['workspaceSlug'] as String,
  data: json['data'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

_$WorkItemDeletedImpl _$$WorkItemDeletedImplFromJson(
  Map<String, dynamic> json,
) => _$WorkItemDeletedImpl(
  workItemId: json['workItemId'] as String,
  projectId: json['projectId'] as String,
  workspaceSlug: json['workspaceSlug'] as String,
  $type: json['runtimeType'] as String?,
);

_$CommentAddedImpl _$$CommentAddedImplFromJson(Map<String, dynamic> json) =>
    _$CommentAddedImpl(
      commentId: json['commentId'] as String,
      workItemId: json['workItemId'] as String,
      projectId: json['projectId'] as String,
      data: json['data'] as Map<String, dynamic>,
      $type: json['runtimeType'] as String?,
    );

_$StateChangedImpl _$$StateChangedImplFromJson(Map<String, dynamic> json) =>
    _$StateChangedImpl(
      workItemId: json['workItemId'] as String,
      projectId: json['projectId'] as String,
      oldStateId: json['oldStateId'] as String,
      newStateId: json['newStateId'] as String,
      $type: json['runtimeType'] as String?,
    );

_$AssigneeChangedImpl _$$AssigneeChangedImplFromJson(
  Map<String, dynamic> json,
) => _$AssigneeChangedImpl(
  workItemId: json['workItemId'] as String,
  projectId: json['projectId'] as String,
  assigneeIds: (json['assigneeIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  $type: json['runtimeType'] as String?,
);

_$CycleUpdatedImpl _$$CycleUpdatedImplFromJson(Map<String, dynamic> json) =>
    _$CycleUpdatedImpl(
      cycleId: json['cycleId'] as String,
      projectId: json['projectId'] as String,
      data: json['data'] as Map<String, dynamic>,
      $type: json['runtimeType'] as String?,
    );

_$PresenceUpdateImpl _$$PresenceUpdateImplFromJson(Map<String, dynamic> json) =>
    _$PresenceUpdateImpl(
      userId: json['userId'] as String,
      workspaceSlug: json['workspaceSlug'] as String,
      status: $enumDecode(_$PresenceStatusEnumMap, json['status']),
      $type: json['runtimeType'] as String?,
    );

const _$PresenceStatusEnumMap = {
  PresenceStatus.online: 'online',
  PresenceStatus.away: 'away',
  PresenceStatus.offline: 'offline',
};

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plane_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlaneEvent _$PlaneEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'workItemCreated':
      return WorkItemCreated.fromJson(json);
    case 'workItemUpdated':
      return WorkItemUpdated.fromJson(json);
    case 'workItemDeleted':
      return WorkItemDeleted.fromJson(json);
    case 'commentAdded':
      return CommentAdded.fromJson(json);
    case 'stateChanged':
      return StateChanged.fromJson(json);
    case 'assigneeChanged':
      return AssigneeChanged.fromJson(json);
    case 'cycleUpdated':
      return CycleUpdated.fromJson(json);
    case 'presenceUpdate':
      return PresenceUpdate.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'PlaneEvent',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$PlaneEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaneEventCopyWith<$Res> {
  factory $PlaneEventCopyWith(
    PlaneEvent value,
    $Res Function(PlaneEvent) then,
  ) = _$PlaneEventCopyWithImpl<$Res, PlaneEvent>;
}

/// @nodoc
class _$PlaneEventCopyWithImpl<$Res, $Val extends PlaneEvent>
    implements $PlaneEventCopyWith<$Res> {
  _$PlaneEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WorkItemCreatedImplCopyWith<$Res> {
  factory _$$WorkItemCreatedImplCopyWith(
    _$WorkItemCreatedImpl value,
    $Res Function(_$WorkItemCreatedImpl) then,
  ) = __$$WorkItemCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String workItemId,
    String projectId,
    String workspaceSlug,
    Map<String, dynamic> data,
  });
}

/// @nodoc
class __$$WorkItemCreatedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$WorkItemCreatedImpl>
    implements _$$WorkItemCreatedImplCopyWith<$Res> {
  __$$WorkItemCreatedImplCopyWithImpl(
    _$WorkItemCreatedImpl _value,
    $Res Function(_$WorkItemCreatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workItemId = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
    Object? data = null,
  }) {
    return _then(
      _$WorkItemCreatedImpl(
        workItemId: null == workItemId
            ? _value.workItemId
            : workItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceSlug: null == workspaceSlug
            ? _value.workspaceSlug
            : workspaceSlug // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$WorkItemCreatedImpl implements WorkItemCreated {
  const _$WorkItemCreatedImpl({
    required this.workItemId,
    required this.projectId,
    required this.workspaceSlug,
    required final Map<String, dynamic> data,
    final String? $type,
  }) : _data = data,
       $type = $type ?? 'workItemCreated';

  factory _$WorkItemCreatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemCreatedImplFromJson(json);

  @override
  final String workItemId;
  @override
  final String projectId;
  @override
  final String workspaceSlug;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.workItemCreated(workItemId: $workItemId, projectId: $projectId, workspaceSlug: $workspaceSlug, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemCreatedImpl &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.workspaceSlug, workspaceSlug) ||
                other.workspaceSlug == workspaceSlug) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    workItemId,
    projectId,
    workspaceSlug,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemCreatedImplCopyWith<_$WorkItemCreatedImpl> get copyWith =>
      __$$WorkItemCreatedImplCopyWithImpl<_$WorkItemCreatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return workItemCreated(workItemId, projectId, workspaceSlug, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return workItemCreated?.call(workItemId, projectId, workspaceSlug, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (workItemCreated != null) {
      return workItemCreated(workItemId, projectId, workspaceSlug, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return workItemCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return workItemCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (workItemCreated != null) {
      return workItemCreated(this);
    }
    return orElse();
  }
}

abstract class WorkItemCreated implements PlaneEvent {
  const factory WorkItemCreated({
    required final String workItemId,
    required final String projectId,
    required final String workspaceSlug,
    required final Map<String, dynamic> data,
  }) = _$WorkItemCreatedImpl;

  factory WorkItemCreated.fromJson(Map<String, dynamic> json) =
      _$WorkItemCreatedImpl.fromJson;

  String get workItemId;
  String get projectId;
  String get workspaceSlug;
  Map<String, dynamic> get data;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemCreatedImplCopyWith<_$WorkItemCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkItemUpdatedImplCopyWith<$Res> {
  factory _$$WorkItemUpdatedImplCopyWith(
    _$WorkItemUpdatedImpl value,
    $Res Function(_$WorkItemUpdatedImpl) then,
  ) = __$$WorkItemUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String workItemId,
    String projectId,
    String workspaceSlug,
    Map<String, dynamic> data,
  });
}

/// @nodoc
class __$$WorkItemUpdatedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$WorkItemUpdatedImpl>
    implements _$$WorkItemUpdatedImplCopyWith<$Res> {
  __$$WorkItemUpdatedImplCopyWithImpl(
    _$WorkItemUpdatedImpl _value,
    $Res Function(_$WorkItemUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workItemId = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
    Object? data = null,
  }) {
    return _then(
      _$WorkItemUpdatedImpl(
        workItemId: null == workItemId
            ? _value.workItemId
            : workItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceSlug: null == workspaceSlug
            ? _value.workspaceSlug
            : workspaceSlug // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$WorkItemUpdatedImpl implements WorkItemUpdated {
  const _$WorkItemUpdatedImpl({
    required this.workItemId,
    required this.projectId,
    required this.workspaceSlug,
    required final Map<String, dynamic> data,
    final String? $type,
  }) : _data = data,
       $type = $type ?? 'workItemUpdated';

  factory _$WorkItemUpdatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemUpdatedImplFromJson(json);

  @override
  final String workItemId;
  @override
  final String projectId;
  @override
  final String workspaceSlug;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.workItemUpdated(workItemId: $workItemId, projectId: $projectId, workspaceSlug: $workspaceSlug, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemUpdatedImpl &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.workspaceSlug, workspaceSlug) ||
                other.workspaceSlug == workspaceSlug) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    workItemId,
    projectId,
    workspaceSlug,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemUpdatedImplCopyWith<_$WorkItemUpdatedImpl> get copyWith =>
      __$$WorkItemUpdatedImplCopyWithImpl<_$WorkItemUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return workItemUpdated(workItemId, projectId, workspaceSlug, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return workItemUpdated?.call(workItemId, projectId, workspaceSlug, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (workItemUpdated != null) {
      return workItemUpdated(workItemId, projectId, workspaceSlug, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return workItemUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return workItemUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (workItemUpdated != null) {
      return workItemUpdated(this);
    }
    return orElse();
  }
}

abstract class WorkItemUpdated implements PlaneEvent {
  const factory WorkItemUpdated({
    required final String workItemId,
    required final String projectId,
    required final String workspaceSlug,
    required final Map<String, dynamic> data,
  }) = _$WorkItemUpdatedImpl;

  factory WorkItemUpdated.fromJson(Map<String, dynamic> json) =
      _$WorkItemUpdatedImpl.fromJson;

  String get workItemId;
  String get projectId;
  String get workspaceSlug;
  Map<String, dynamic> get data;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemUpdatedImplCopyWith<_$WorkItemUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkItemDeletedImplCopyWith<$Res> {
  factory _$$WorkItemDeletedImplCopyWith(
    _$WorkItemDeletedImpl value,
    $Res Function(_$WorkItemDeletedImpl) then,
  ) = __$$WorkItemDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String workItemId, String projectId, String workspaceSlug});
}

/// @nodoc
class __$$WorkItemDeletedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$WorkItemDeletedImpl>
    implements _$$WorkItemDeletedImplCopyWith<$Res> {
  __$$WorkItemDeletedImplCopyWithImpl(
    _$WorkItemDeletedImpl _value,
    $Res Function(_$WorkItemDeletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workItemId = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
  }) {
    return _then(
      _$WorkItemDeletedImpl(
        workItemId: null == workItemId
            ? _value.workItemId
            : workItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceSlug: null == workspaceSlug
            ? _value.workspaceSlug
            : workspaceSlug // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$WorkItemDeletedImpl implements WorkItemDeleted {
  const _$WorkItemDeletedImpl({
    required this.workItemId,
    required this.projectId,
    required this.workspaceSlug,
    final String? $type,
  }) : $type = $type ?? 'workItemDeleted';

  factory _$WorkItemDeletedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemDeletedImplFromJson(json);

  @override
  final String workItemId;
  @override
  final String projectId;
  @override
  final String workspaceSlug;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.workItemDeleted(workItemId: $workItemId, projectId: $projectId, workspaceSlug: $workspaceSlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemDeletedImpl &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.workspaceSlug, workspaceSlug) ||
                other.workspaceSlug == workspaceSlug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, workItemId, projectId, workspaceSlug);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemDeletedImplCopyWith<_$WorkItemDeletedImpl> get copyWith =>
      __$$WorkItemDeletedImplCopyWithImpl<_$WorkItemDeletedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return workItemDeleted(workItemId, projectId, workspaceSlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return workItemDeleted?.call(workItemId, projectId, workspaceSlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (workItemDeleted != null) {
      return workItemDeleted(workItemId, projectId, workspaceSlug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return workItemDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return workItemDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (workItemDeleted != null) {
      return workItemDeleted(this);
    }
    return orElse();
  }
}

abstract class WorkItemDeleted implements PlaneEvent {
  const factory WorkItemDeleted({
    required final String workItemId,
    required final String projectId,
    required final String workspaceSlug,
  }) = _$WorkItemDeletedImpl;

  factory WorkItemDeleted.fromJson(Map<String, dynamic> json) =
      _$WorkItemDeletedImpl.fromJson;

  String get workItemId;
  String get projectId;
  String get workspaceSlug;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemDeletedImplCopyWith<_$WorkItemDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommentAddedImplCopyWith<$Res> {
  factory _$$CommentAddedImplCopyWith(
    _$CommentAddedImpl value,
    $Res Function(_$CommentAddedImpl) then,
  ) = __$$CommentAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String commentId,
    String workItemId,
    String projectId,
    Map<String, dynamic> data,
  });
}

/// @nodoc
class __$$CommentAddedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$CommentAddedImpl>
    implements _$$CommentAddedImplCopyWith<$Res> {
  __$$CommentAddedImplCopyWithImpl(
    _$CommentAddedImpl _value,
    $Res Function(_$CommentAddedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? workItemId = null,
    Object? projectId = null,
    Object? data = null,
  }) {
    return _then(
      _$CommentAddedImpl(
        commentId: null == commentId
            ? _value.commentId
            : commentId // ignore: cast_nullable_to_non_nullable
                  as String,
        workItemId: null == workItemId
            ? _value.workItemId
            : workItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CommentAddedImpl implements CommentAdded {
  const _$CommentAddedImpl({
    required this.commentId,
    required this.workItemId,
    required this.projectId,
    required final Map<String, dynamic> data,
    final String? $type,
  }) : _data = data,
       $type = $type ?? 'commentAdded';

  factory _$CommentAddedImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentAddedImplFromJson(json);

  @override
  final String commentId;
  @override
  final String workItemId;
  @override
  final String projectId;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.commentAdded(commentId: $commentId, workItemId: $workItemId, projectId: $projectId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentAddedImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    commentId,
    workItemId,
    projectId,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentAddedImplCopyWith<_$CommentAddedImpl> get copyWith =>
      __$$CommentAddedImplCopyWithImpl<_$CommentAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return commentAdded(commentId, workItemId, projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return commentAdded?.call(commentId, workItemId, projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (commentAdded != null) {
      return commentAdded(commentId, workItemId, projectId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return commentAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return commentAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (commentAdded != null) {
      return commentAdded(this);
    }
    return orElse();
  }
}

abstract class CommentAdded implements PlaneEvent {
  const factory CommentAdded({
    required final String commentId,
    required final String workItemId,
    required final String projectId,
    required final Map<String, dynamic> data,
  }) = _$CommentAddedImpl;

  factory CommentAdded.fromJson(Map<String, dynamic> json) =
      _$CommentAddedImpl.fromJson;

  String get commentId;
  String get workItemId;
  String get projectId;
  Map<String, dynamic> get data;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentAddedImplCopyWith<_$CommentAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StateChangedImplCopyWith<$Res> {
  factory _$$StateChangedImplCopyWith(
    _$StateChangedImpl value,
    $Res Function(_$StateChangedImpl) then,
  ) = __$$StateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String workItemId,
    String projectId,
    String oldStateId,
    String newStateId,
  });
}

/// @nodoc
class __$$StateChangedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$StateChangedImpl>
    implements _$$StateChangedImplCopyWith<$Res> {
  __$$StateChangedImplCopyWithImpl(
    _$StateChangedImpl _value,
    $Res Function(_$StateChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workItemId = null,
    Object? projectId = null,
    Object? oldStateId = null,
    Object? newStateId = null,
  }) {
    return _then(
      _$StateChangedImpl(
        workItemId: null == workItemId
            ? _value.workItemId
            : workItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        oldStateId: null == oldStateId
            ? _value.oldStateId
            : oldStateId // ignore: cast_nullable_to_non_nullable
                  as String,
        newStateId: null == newStateId
            ? _value.newStateId
            : newStateId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StateChangedImpl implements StateChanged {
  const _$StateChangedImpl({
    required this.workItemId,
    required this.projectId,
    required this.oldStateId,
    required this.newStateId,
    final String? $type,
  }) : $type = $type ?? 'stateChanged';

  factory _$StateChangedImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateChangedImplFromJson(json);

  @override
  final String workItemId;
  @override
  final String projectId;
  @override
  final String oldStateId;
  @override
  final String newStateId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.stateChanged(workItemId: $workItemId, projectId: $projectId, oldStateId: $oldStateId, newStateId: $newStateId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateChangedImpl &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.oldStateId, oldStateId) ||
                other.oldStateId == oldStateId) &&
            (identical(other.newStateId, newStateId) ||
                other.newStateId == newStateId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, workItemId, projectId, oldStateId, newStateId);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateChangedImplCopyWith<_$StateChangedImpl> get copyWith =>
      __$$StateChangedImplCopyWithImpl<_$StateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return stateChanged(workItemId, projectId, oldStateId, newStateId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return stateChanged?.call(workItemId, projectId, oldStateId, newStateId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (stateChanged != null) {
      return stateChanged(workItemId, projectId, oldStateId, newStateId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return stateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return stateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (stateChanged != null) {
      return stateChanged(this);
    }
    return orElse();
  }
}

abstract class StateChanged implements PlaneEvent {
  const factory StateChanged({
    required final String workItemId,
    required final String projectId,
    required final String oldStateId,
    required final String newStateId,
  }) = _$StateChangedImpl;

  factory StateChanged.fromJson(Map<String, dynamic> json) =
      _$StateChangedImpl.fromJson;

  String get workItemId;
  String get projectId;
  String get oldStateId;
  String get newStateId;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateChangedImplCopyWith<_$StateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssigneeChangedImplCopyWith<$Res> {
  factory _$$AssigneeChangedImplCopyWith(
    _$AssigneeChangedImpl value,
    $Res Function(_$AssigneeChangedImpl) then,
  ) = __$$AssigneeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String workItemId, String projectId, List<String> assigneeIds});
}

/// @nodoc
class __$$AssigneeChangedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$AssigneeChangedImpl>
    implements _$$AssigneeChangedImplCopyWith<$Res> {
  __$$AssigneeChangedImplCopyWithImpl(
    _$AssigneeChangedImpl _value,
    $Res Function(_$AssigneeChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workItemId = null,
    Object? projectId = null,
    Object? assigneeIds = null,
  }) {
    return _then(
      _$AssigneeChangedImpl(
        workItemId: null == workItemId
            ? _value.workItemId
            : workItemId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        assigneeIds: null == assigneeIds
            ? _value._assigneeIds
            : assigneeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AssigneeChangedImpl implements AssigneeChanged {
  const _$AssigneeChangedImpl({
    required this.workItemId,
    required this.projectId,
    required final List<String> assigneeIds,
    final String? $type,
  }) : _assigneeIds = assigneeIds,
       $type = $type ?? 'assigneeChanged';

  factory _$AssigneeChangedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssigneeChangedImplFromJson(json);

  @override
  final String workItemId;
  @override
  final String projectId;
  final List<String> _assigneeIds;
  @override
  List<String> get assigneeIds {
    if (_assigneeIds is EqualUnmodifiableListView) return _assigneeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assigneeIds);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.assigneeChanged(workItemId: $workItemId, projectId: $projectId, assigneeIds: $assigneeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssigneeChangedImpl &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(
              other._assigneeIds,
              _assigneeIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    workItemId,
    projectId,
    const DeepCollectionEquality().hash(_assigneeIds),
  );

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssigneeChangedImplCopyWith<_$AssigneeChangedImpl> get copyWith =>
      __$$AssigneeChangedImplCopyWithImpl<_$AssigneeChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return assigneeChanged(workItemId, projectId, assigneeIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return assigneeChanged?.call(workItemId, projectId, assigneeIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (assigneeChanged != null) {
      return assigneeChanged(workItemId, projectId, assigneeIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return assigneeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return assigneeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (assigneeChanged != null) {
      return assigneeChanged(this);
    }
    return orElse();
  }
}

abstract class AssigneeChanged implements PlaneEvent {
  const factory AssigneeChanged({
    required final String workItemId,
    required final String projectId,
    required final List<String> assigneeIds,
  }) = _$AssigneeChangedImpl;

  factory AssigneeChanged.fromJson(Map<String, dynamic> json) =
      _$AssigneeChangedImpl.fromJson;

  String get workItemId;
  String get projectId;
  List<String> get assigneeIds;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssigneeChangedImplCopyWith<_$AssigneeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CycleUpdatedImplCopyWith<$Res> {
  factory _$$CycleUpdatedImplCopyWith(
    _$CycleUpdatedImpl value,
    $Res Function(_$CycleUpdatedImpl) then,
  ) = __$$CycleUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cycleId, String projectId, Map<String, dynamic> data});
}

/// @nodoc
class __$$CycleUpdatedImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$CycleUpdatedImpl>
    implements _$$CycleUpdatedImplCopyWith<$Res> {
  __$$CycleUpdatedImplCopyWithImpl(
    _$CycleUpdatedImpl _value,
    $Res Function(_$CycleUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycleId = null,
    Object? projectId = null,
    Object? data = null,
  }) {
    return _then(
      _$CycleUpdatedImpl(
        cycleId: null == cycleId
            ? _value.cycleId
            : cycleId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CycleUpdatedImpl implements CycleUpdated {
  const _$CycleUpdatedImpl({
    required this.cycleId,
    required this.projectId,
    required final Map<String, dynamic> data,
    final String? $type,
  }) : _data = data,
       $type = $type ?? 'cycleUpdated';

  factory _$CycleUpdatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleUpdatedImplFromJson(json);

  @override
  final String cycleId;
  @override
  final String projectId;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.cycleUpdated(cycleId: $cycleId, projectId: $projectId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleUpdatedImpl &&
            (identical(other.cycleId, cycleId) || other.cycleId == cycleId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cycleId,
    projectId,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleUpdatedImplCopyWith<_$CycleUpdatedImpl> get copyWith =>
      __$$CycleUpdatedImplCopyWithImpl<_$CycleUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return cycleUpdated(cycleId, projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return cycleUpdated?.call(cycleId, projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (cycleUpdated != null) {
      return cycleUpdated(cycleId, projectId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return cycleUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return cycleUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (cycleUpdated != null) {
      return cycleUpdated(this);
    }
    return orElse();
  }
}

abstract class CycleUpdated implements PlaneEvent {
  const factory CycleUpdated({
    required final String cycleId,
    required final String projectId,
    required final Map<String, dynamic> data,
  }) = _$CycleUpdatedImpl;

  factory CycleUpdated.fromJson(Map<String, dynamic> json) =
      _$CycleUpdatedImpl.fromJson;

  String get cycleId;
  String get projectId;
  Map<String, dynamic> get data;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CycleUpdatedImplCopyWith<_$CycleUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresenceUpdateImplCopyWith<$Res> {
  factory _$$PresenceUpdateImplCopyWith(
    _$PresenceUpdateImpl value,
    $Res Function(_$PresenceUpdateImpl) then,
  ) = __$$PresenceUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String workspaceSlug, PresenceStatus status});
}

/// @nodoc
class __$$PresenceUpdateImplCopyWithImpl<$Res>
    extends _$PlaneEventCopyWithImpl<$Res, _$PresenceUpdateImpl>
    implements _$$PresenceUpdateImplCopyWith<$Res> {
  __$$PresenceUpdateImplCopyWithImpl(
    _$PresenceUpdateImpl _value,
    $Res Function(_$PresenceUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? workspaceSlug = null,
    Object? status = null,
  }) {
    return _then(
      _$PresenceUpdateImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceSlug: null == workspaceSlug
            ? _value.workspaceSlug
            : workspaceSlug // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PresenceStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PresenceUpdateImpl implements PresenceUpdate {
  const _$PresenceUpdateImpl({
    required this.userId,
    required this.workspaceSlug,
    required this.status,
    final String? $type,
  }) : $type = $type ?? 'presenceUpdate';

  factory _$PresenceUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceUpdateImplFromJson(json);

  @override
  final String userId;
  @override
  final String workspaceSlug;
  @override
  final PresenceStatus status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaneEvent.presenceUpdate(userId: $userId, workspaceSlug: $workspaceSlug, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceUpdateImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.workspaceSlug, workspaceSlug) ||
                other.workspaceSlug == workspaceSlug) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, workspaceSlug, status);

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceUpdateImplCopyWith<_$PresenceUpdateImpl> get copyWith =>
      __$$PresenceUpdateImplCopyWithImpl<_$PresenceUpdateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemCreated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )
    workItemUpdated,
    required TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )
    workItemDeleted,
    required TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )
    commentAdded,
    required TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )
    stateChanged,
    required TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )
    assigneeChanged,
    required TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )
    cycleUpdated,
    required TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )
    presenceUpdate,
  }) {
    return presenceUpdate(userId, workspaceSlug, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult? Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
    )?
    workItemDeleted,
    TResult? Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult? Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult? Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult? Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult? Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
  }) {
    return presenceUpdate?.call(userId, workspaceSlug, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemCreated,
    TResult Function(
      String workItemId,
      String projectId,
      String workspaceSlug,
      Map<String, dynamic> data,
    )?
    workItemUpdated,
    TResult Function(String workItemId, String projectId, String workspaceSlug)?
    workItemDeleted,
    TResult Function(
      String commentId,
      String workItemId,
      String projectId,
      Map<String, dynamic> data,
    )?
    commentAdded,
    TResult Function(
      String workItemId,
      String projectId,
      String oldStateId,
      String newStateId,
    )?
    stateChanged,
    TResult Function(
      String workItemId,
      String projectId,
      List<String> assigneeIds,
    )?
    assigneeChanged,
    TResult Function(
      String cycleId,
      String projectId,
      Map<String, dynamic> data,
    )?
    cycleUpdated,
    TResult Function(
      String userId,
      String workspaceSlug,
      PresenceStatus status,
    )?
    presenceUpdate,
    required TResult orElse(),
  }) {
    if (presenceUpdate != null) {
      return presenceUpdate(userId, workspaceSlug, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkItemCreated value) workItemCreated,
    required TResult Function(WorkItemUpdated value) workItemUpdated,
    required TResult Function(WorkItemDeleted value) workItemDeleted,
    required TResult Function(CommentAdded value) commentAdded,
    required TResult Function(StateChanged value) stateChanged,
    required TResult Function(AssigneeChanged value) assigneeChanged,
    required TResult Function(CycleUpdated value) cycleUpdated,
    required TResult Function(PresenceUpdate value) presenceUpdate,
  }) {
    return presenceUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkItemCreated value)? workItemCreated,
    TResult? Function(WorkItemUpdated value)? workItemUpdated,
    TResult? Function(WorkItemDeleted value)? workItemDeleted,
    TResult? Function(CommentAdded value)? commentAdded,
    TResult? Function(StateChanged value)? stateChanged,
    TResult? Function(AssigneeChanged value)? assigneeChanged,
    TResult? Function(CycleUpdated value)? cycleUpdated,
    TResult? Function(PresenceUpdate value)? presenceUpdate,
  }) {
    return presenceUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkItemCreated value)? workItemCreated,
    TResult Function(WorkItemUpdated value)? workItemUpdated,
    TResult Function(WorkItemDeleted value)? workItemDeleted,
    TResult Function(CommentAdded value)? commentAdded,
    TResult Function(StateChanged value)? stateChanged,
    TResult Function(AssigneeChanged value)? assigneeChanged,
    TResult Function(CycleUpdated value)? cycleUpdated,
    TResult Function(PresenceUpdate value)? presenceUpdate,
    required TResult orElse(),
  }) {
    if (presenceUpdate != null) {
      return presenceUpdate(this);
    }
    return orElse();
  }
}

abstract class PresenceUpdate implements PlaneEvent {
  const factory PresenceUpdate({
    required final String userId,
    required final String workspaceSlug,
    required final PresenceStatus status,
  }) = _$PresenceUpdateImpl;

  factory PresenceUpdate.fromJson(Map<String, dynamic> json) =
      _$PresenceUpdateImpl.fromJson;

  String get userId;
  String get workspaceSlug;
  PresenceStatus get status;

  /// Create a copy of PlaneEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceUpdateImplCopyWith<_$PresenceUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

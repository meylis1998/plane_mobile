// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkItem _$WorkItemFromJson(Map<String, dynamic> json) {
  return _WorkItem.fromJson(json);
}

/// @nodoc
mixin _$WorkItem {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get workspaceSlug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  WorkItemState get state => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get descriptionHtml => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get targetDate => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int? get sequenceId => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  List<String>? get assigneeIds => throw _privateConstructorUsedError;
  List<String>? get labelIds => throw _privateConstructorUsedError;
  String? get cycleId => throw _privateConstructorUsedError;
  String? get moduleId => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get estimate => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;
  int get localVersion => throw _privateConstructorUsedError;
  int? get serverVersion => throw _privateConstructorUsedError;

  /// Serializes this WorkItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkItemCopyWith<WorkItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkItemCopyWith<$Res> {
  factory $WorkItemCopyWith(WorkItem value, $Res Function(WorkItem) then) =
      _$WorkItemCopyWithImpl<$Res, WorkItem>;
  @useResult
  $Res call({
    String id,
    String projectId,
    String workspaceSlug,
    String name,
    WorkItemState state,
    Priority priority,
    String? description,
    String? descriptionHtml,
    DateTime? startDate,
    DateTime? targetDate,
    String? parentId,
    int? sequenceId,
    int sortOrder,
    List<String>? assigneeIds,
    List<String>? labelIds,
    String? cycleId,
    String? moduleId,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? estimate,
    bool isDirty,
    int localVersion,
    int? serverVersion,
  });

  $WorkItemStateCopyWith<$Res> get state;
}

/// @nodoc
class _$WorkItemCopyWithImpl<$Res, $Val extends WorkItem>
    implements $WorkItemCopyWith<$Res> {
  _$WorkItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
    Object? name = null,
    Object? state = null,
    Object? priority = null,
    Object? description = freezed,
    Object? descriptionHtml = freezed,
    Object? startDate = freezed,
    Object? targetDate = freezed,
    Object? parentId = freezed,
    Object? sequenceId = freezed,
    Object? sortOrder = null,
    Object? assigneeIds = freezed,
    Object? labelIds = freezed,
    Object? cycleId = freezed,
    Object? moduleId = freezed,
    Object? createdById = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? estimate = freezed,
    Object? isDirty = null,
    Object? localVersion = null,
    Object? serverVersion = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            workspaceSlug: null == workspaceSlug
                ? _value.workspaceSlug
                : workspaceSlug // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as WorkItemState,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as Priority,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionHtml: freezed == descriptionHtml
                ? _value.descriptionHtml
                : descriptionHtml // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            targetDate: freezed == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sequenceId: freezed == sequenceId
                ? _value.sequenceId
                : sequenceId // ignore: cast_nullable_to_non_nullable
                      as int?,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            assigneeIds: freezed == assigneeIds
                ? _value.assigneeIds
                : assigneeIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            labelIds: freezed == labelIds
                ? _value.labelIds
                : labelIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            cycleId: freezed == cycleId
                ? _value.cycleId
                : cycleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            moduleId: freezed == moduleId
                ? _value.moduleId
                : moduleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdById: freezed == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            estimate: freezed == estimate
                ? _value.estimate
                : estimate // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDirty: null == isDirty
                ? _value.isDirty
                : isDirty // ignore: cast_nullable_to_non_nullable
                      as bool,
            localVersion: null == localVersion
                ? _value.localVersion
                : localVersion // ignore: cast_nullable_to_non_nullable
                      as int,
            serverVersion: freezed == serverVersion
                ? _value.serverVersion
                : serverVersion // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkItemStateCopyWith<$Res> get state {
    return $WorkItemStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkItemImplCopyWith<$Res>
    implements $WorkItemCopyWith<$Res> {
  factory _$$WorkItemImplCopyWith(
    _$WorkItemImpl value,
    $Res Function(_$WorkItemImpl) then,
  ) = __$$WorkItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String projectId,
    String workspaceSlug,
    String name,
    WorkItemState state,
    Priority priority,
    String? description,
    String? descriptionHtml,
    DateTime? startDate,
    DateTime? targetDate,
    String? parentId,
    int? sequenceId,
    int sortOrder,
    List<String>? assigneeIds,
    List<String>? labelIds,
    String? cycleId,
    String? moduleId,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? estimate,
    bool isDirty,
    int localVersion,
    int? serverVersion,
  });

  @override
  $WorkItemStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$WorkItemImplCopyWithImpl<$Res>
    extends _$WorkItemCopyWithImpl<$Res, _$WorkItemImpl>
    implements _$$WorkItemImplCopyWith<$Res> {
  __$$WorkItemImplCopyWithImpl(
    _$WorkItemImpl _value,
    $Res Function(_$WorkItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
    Object? name = null,
    Object? state = null,
    Object? priority = null,
    Object? description = freezed,
    Object? descriptionHtml = freezed,
    Object? startDate = freezed,
    Object? targetDate = freezed,
    Object? parentId = freezed,
    Object? sequenceId = freezed,
    Object? sortOrder = null,
    Object? assigneeIds = freezed,
    Object? labelIds = freezed,
    Object? cycleId = freezed,
    Object? moduleId = freezed,
    Object? createdById = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? estimate = freezed,
    Object? isDirty = null,
    Object? localVersion = null,
    Object? serverVersion = freezed,
  }) {
    return _then(
      _$WorkItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceSlug: null == workspaceSlug
            ? _value.workspaceSlug
            : workspaceSlug // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as WorkItemState,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as Priority,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionHtml: freezed == descriptionHtml
            ? _value.descriptionHtml
            : descriptionHtml // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        targetDate: freezed == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sequenceId: freezed == sequenceId
            ? _value.sequenceId
            : sequenceId // ignore: cast_nullable_to_non_nullable
                  as int?,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        assigneeIds: freezed == assigneeIds
            ? _value._assigneeIds
            : assigneeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        labelIds: freezed == labelIds
            ? _value._labelIds
            : labelIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        cycleId: freezed == cycleId
            ? _value.cycleId
            : cycleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        moduleId: freezed == moduleId
            ? _value.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdById: freezed == createdById
            ? _value.createdById
            : createdById // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        estimate: freezed == estimate
            ? _value.estimate
            : estimate // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDirty: null == isDirty
            ? _value.isDirty
            : isDirty // ignore: cast_nullable_to_non_nullable
                  as bool,
        localVersion: null == localVersion
            ? _value.localVersion
            : localVersion // ignore: cast_nullable_to_non_nullable
                  as int,
        serverVersion: freezed == serverVersion
            ? _value.serverVersion
            : serverVersion // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkItemImpl implements _WorkItem {
  const _$WorkItemImpl({
    required this.id,
    required this.projectId,
    required this.workspaceSlug,
    required this.name,
    required this.state,
    required this.priority,
    this.description,
    this.descriptionHtml,
    this.startDate,
    this.targetDate,
    this.parentId,
    this.sequenceId,
    this.sortOrder = 0,
    final List<String>? assigneeIds,
    final List<String>? labelIds,
    this.cycleId,
    this.moduleId,
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.estimate,
    this.isDirty = false,
    this.localVersion = 0,
    this.serverVersion,
  }) : _assigneeIds = assigneeIds,
       _labelIds = labelIds;

  factory _$WorkItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String workspaceSlug;
  @override
  final String name;
  @override
  final WorkItemState state;
  @override
  final Priority priority;
  @override
  final String? description;
  @override
  final String? descriptionHtml;
  @override
  final DateTime? startDate;
  @override
  final DateTime? targetDate;
  @override
  final String? parentId;
  @override
  final int? sequenceId;
  @override
  @JsonKey()
  final int sortOrder;
  final List<String>? _assigneeIds;
  @override
  List<String>? get assigneeIds {
    final value = _assigneeIds;
    if (value == null) return null;
    if (_assigneeIds is EqualUnmodifiableListView) return _assigneeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _labelIds;
  @override
  List<String>? get labelIds {
    final value = _labelIds;
    if (value == null) return null;
    if (_labelIds is EqualUnmodifiableListView) return _labelIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? cycleId;
  @override
  final String? moduleId;
  @override
  final String? createdById;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? estimate;
  @override
  @JsonKey()
  final bool isDirty;
  @override
  @JsonKey()
  final int localVersion;
  @override
  final int? serverVersion;

  @override
  String toString() {
    return 'WorkItem(id: $id, projectId: $projectId, workspaceSlug: $workspaceSlug, name: $name, state: $state, priority: $priority, description: $description, descriptionHtml: $descriptionHtml, startDate: $startDate, targetDate: $targetDate, parentId: $parentId, sequenceId: $sequenceId, sortOrder: $sortOrder, assigneeIds: $assigneeIds, labelIds: $labelIds, cycleId: $cycleId, moduleId: $moduleId, createdById: $createdById, createdAt: $createdAt, updatedAt: $updatedAt, estimate: $estimate, isDirty: $isDirty, localVersion: $localVersion, serverVersion: $serverVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.workspaceSlug, workspaceSlug) ||
                other.workspaceSlug == workspaceSlug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionHtml, descriptionHtml) ||
                other.descriptionHtml == descriptionHtml) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.sequenceId, sequenceId) ||
                other.sequenceId == sequenceId) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(
              other._assigneeIds,
              _assigneeIds,
            ) &&
            const DeepCollectionEquality().equals(other._labelIds, _labelIds) &&
            (identical(other.cycleId, cycleId) || other.cycleId == cycleId) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.estimate, estimate) ||
                other.estimate == estimate) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.serverVersion, serverVersion) ||
                other.serverVersion == serverVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    projectId,
    workspaceSlug,
    name,
    state,
    priority,
    description,
    descriptionHtml,
    startDate,
    targetDate,
    parentId,
    sequenceId,
    sortOrder,
    const DeepCollectionEquality().hash(_assigneeIds),
    const DeepCollectionEquality().hash(_labelIds),
    cycleId,
    moduleId,
    createdById,
    createdAt,
    updatedAt,
    estimate,
    isDirty,
    localVersion,
    serverVersion,
  ]);

  /// Create a copy of WorkItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemImplCopyWith<_$WorkItemImpl> get copyWith =>
      __$$WorkItemImplCopyWithImpl<_$WorkItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkItemImplToJson(this);
  }
}

abstract class _WorkItem implements WorkItem {
  const factory _WorkItem({
    required final String id,
    required final String projectId,
    required final String workspaceSlug,
    required final String name,
    required final WorkItemState state,
    required final Priority priority,
    final String? description,
    final String? descriptionHtml,
    final DateTime? startDate,
    final DateTime? targetDate,
    final String? parentId,
    final int? sequenceId,
    final int sortOrder,
    final List<String>? assigneeIds,
    final List<String>? labelIds,
    final String? cycleId,
    final String? moduleId,
    final String? createdById,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final int? estimate,
    final bool isDirty,
    final int localVersion,
    final int? serverVersion,
  }) = _$WorkItemImpl;

  factory _WorkItem.fromJson(Map<String, dynamic> json) =
      _$WorkItemImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get workspaceSlug;
  @override
  String get name;
  @override
  WorkItemState get state;
  @override
  Priority get priority;
  @override
  String? get description;
  @override
  String? get descriptionHtml;
  @override
  DateTime? get startDate;
  @override
  DateTime? get targetDate;
  @override
  String? get parentId;
  @override
  int? get sequenceId;
  @override
  int get sortOrder;
  @override
  List<String>? get assigneeIds;
  @override
  List<String>? get labelIds;
  @override
  String? get cycleId;
  @override
  String? get moduleId;
  @override
  String? get createdById;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  int? get estimate;
  @override
  bool get isDirty;
  @override
  int get localVersion;
  @override
  int? get serverVersion;

  /// Create a copy of WorkItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemImplCopyWith<_$WorkItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

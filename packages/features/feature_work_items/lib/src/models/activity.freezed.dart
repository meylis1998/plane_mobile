// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  String get id => throw _privateConstructorUsedError;
  String get workItemId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get workspaceSlug => throw _privateConstructorUsedError;
  String get actorId => throw _privateConstructorUsedError;
  String? get field => throw _privateConstructorUsedError;
  String? get oldValue => throw _privateConstructorUsedError;
  String? get newValue => throw _privateConstructorUsedError;
  String? get verb => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call({
    String id,
    String workItemId,
    String projectId,
    String workspaceSlug,
    String actorId,
    String? field,
    String? oldValue,
    String? newValue,
    String? verb,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workItemId = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
    Object? actorId = null,
    Object? field = freezed,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? verb = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
            actorId: null == actorId
                ? _value.actorId
                : actorId // ignore: cast_nullable_to_non_nullable
                      as String,
            field: freezed == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as String?,
            oldValue: freezed == oldValue
                ? _value.oldValue
                : oldValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            newValue: freezed == newValue
                ? _value.newValue
                : newValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            verb: freezed == verb
                ? _value.verb
                : verb // ignore: cast_nullable_to_non_nullable
                      as String?,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
    _$ActivityImpl value,
    $Res Function(_$ActivityImpl) then,
  ) = __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String workItemId,
    String projectId,
    String workspaceSlug,
    String actorId,
    String? field,
    String? oldValue,
    String? newValue,
    String? verb,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
    _$ActivityImpl _value,
    $Res Function(_$ActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workItemId = null,
    Object? projectId = null,
    Object? workspaceSlug = null,
    Object? actorId = null,
    Object? field = freezed,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? verb = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        actorId: null == actorId
            ? _value.actorId
            : actorId // ignore: cast_nullable_to_non_nullable
                  as String,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String?,
        oldValue: freezed == oldValue
            ? _value.oldValue
            : oldValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        newValue: freezed == newValue
            ? _value.newValue
            : newValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        verb: freezed == verb
            ? _value.verb
            : verb // ignore: cast_nullable_to_non_nullable
                  as String?,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityImpl implements _Activity {
  const _$ActivityImpl({
    required this.id,
    required this.workItemId,
    required this.projectId,
    required this.workspaceSlug,
    required this.actorId,
    this.field,
    this.oldValue,
    this.newValue,
    this.verb,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String workItemId;
  @override
  final String projectId;
  @override
  final String workspaceSlug;
  @override
  final String actorId;
  @override
  final String? field;
  @override
  final String? oldValue;
  @override
  final String? newValue;
  @override
  final String? verb;
  @override
  final String? comment;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Activity(id: $id, workItemId: $workItemId, projectId: $projectId, workspaceSlug: $workspaceSlug, actorId: $actorId, field: $field, oldValue: $oldValue, newValue: $newValue, verb: $verb, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workItemId, workItemId) ||
                other.workItemId == workItemId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.workspaceSlug, workspaceSlug) ||
                other.workspaceSlug == workspaceSlug) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.verb, verb) || other.verb == verb) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workItemId,
    projectId,
    workspaceSlug,
    actorId,
    field,
    oldValue,
    newValue,
    verb,
    comment,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(this);
  }
}

abstract class _Activity implements Activity {
  const factory _Activity({
    required final String id,
    required final String workItemId,
    required final String projectId,
    required final String workspaceSlug,
    required final String actorId,
    final String? field,
    final String? oldValue,
    final String? newValue,
    final String? verb,
    final String? comment,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ActivityImpl;

  factory _Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get workItemId;
  @override
  String get projectId;
  @override
  String get workspaceSlug;
  @override
  String get actorId;
  @override
  String? get field;
  @override
  String? get oldValue;
  @override
  String? get newValue;
  @override
  String? get verb;
  @override
  String? get comment;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

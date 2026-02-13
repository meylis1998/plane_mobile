// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkItemState _$WorkItemStateFromJson(Map<String, dynamic> json) {
  return _WorkItemState.fromJson(json);
}

/// @nodoc
mixin _$WorkItemState {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  StateGroup get group => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;

  /// Serializes this WorkItemState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkItemStateCopyWith<WorkItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkItemStateCopyWith<$Res> {
  factory $WorkItemStateCopyWith(
    WorkItemState value,
    $Res Function(WorkItemState) then,
  ) = _$WorkItemStateCopyWithImpl<$Res, WorkItemState>;
  @useResult
  $Res call({
    String id,
    String name,
    StateGroup group,
    String color,
    int sequence,
    String projectId,
  });
}

/// @nodoc
class _$WorkItemStateCopyWithImpl<$Res, $Val extends WorkItemState>
    implements $WorkItemStateCopyWith<$Res> {
  _$WorkItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? group = null,
    Object? color = null,
    Object? sequence = null,
    Object? projectId = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            group: null == group
                ? _value.group
                : group // ignore: cast_nullable_to_non_nullable
                      as StateGroup,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            sequence: null == sequence
                ? _value.sequence
                : sequence // ignore: cast_nullable_to_non_nullable
                      as int,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkItemStateImplCopyWith<$Res>
    implements $WorkItemStateCopyWith<$Res> {
  factory _$$WorkItemStateImplCopyWith(
    _$WorkItemStateImpl value,
    $Res Function(_$WorkItemStateImpl) then,
  ) = __$$WorkItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    StateGroup group,
    String color,
    int sequence,
    String projectId,
  });
}

/// @nodoc
class __$$WorkItemStateImplCopyWithImpl<$Res>
    extends _$WorkItemStateCopyWithImpl<$Res, _$WorkItemStateImpl>
    implements _$$WorkItemStateImplCopyWith<$Res> {
  __$$WorkItemStateImplCopyWithImpl(
    _$WorkItemStateImpl _value,
    $Res Function(_$WorkItemStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? group = null,
    Object? color = null,
    Object? sequence = null,
    Object? projectId = null,
  }) {
    return _then(
      _$WorkItemStateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        group: null == group
            ? _value.group
            : group // ignore: cast_nullable_to_non_nullable
                  as StateGroup,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _value.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkItemStateImpl implements _WorkItemState {
  const _$WorkItemStateImpl({
    required this.id,
    required this.name,
    required this.group,
    required this.color,
    required this.sequence,
    required this.projectId,
  });

  factory _$WorkItemStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemStateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final StateGroup group;
  @override
  final String color;
  @override
  final int sequence;
  @override
  final String projectId;

  @override
  String toString() {
    return 'WorkItemState(id: $id, name: $name, group: $group, color: $color, sequence: $sequence, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, group, color, sequence, projectId);

  /// Create a copy of WorkItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemStateImplCopyWith<_$WorkItemStateImpl> get copyWith =>
      __$$WorkItemStateImplCopyWithImpl<_$WorkItemStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkItemStateImplToJson(this);
  }
}

abstract class _WorkItemState implements WorkItemState {
  const factory _WorkItemState({
    required final String id,
    required final String name,
    required final StateGroup group,
    required final String color,
    required final int sequence,
    required final String projectId,
  }) = _$WorkItemStateImpl;

  factory _WorkItemState.fromJson(Map<String, dynamic> json) =
      _$WorkItemStateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  StateGroup get group;
  @override
  String get color;
  @override
  int get sequence;
  @override
  String get projectId;

  /// Create a copy of WorkItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemStateImplCopyWith<_$WorkItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

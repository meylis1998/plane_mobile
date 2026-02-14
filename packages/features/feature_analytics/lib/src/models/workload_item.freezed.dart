// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workload_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkloadItem _$WorkloadItemFromJson(Map<String, dynamic> json) {
  return _WorkloadItem.fromJson(json);
}

/// @nodoc
mixin _$WorkloadItem {
  String get memberId => throw _privateConstructorUsedError;
  String get memberName => throw _privateConstructorUsedError;
  int get assignedCount => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this WorkloadItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkloadItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkloadItemCopyWith<WorkloadItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkloadItemCopyWith<$Res> {
  factory $WorkloadItemCopyWith(
    WorkloadItem value,
    $Res Function(WorkloadItem) then,
  ) = _$WorkloadItemCopyWithImpl<$Res, WorkloadItem>;
  @useResult
  $Res call({
    String memberId,
    String memberName,
    int assignedCount,
    int completedCount,
    String? avatar,
  });
}

/// @nodoc
class _$WorkloadItemCopyWithImpl<$Res, $Val extends WorkloadItem>
    implements $WorkloadItemCopyWith<$Res> {
  _$WorkloadItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkloadItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? memberName = null,
    Object? assignedCount = null,
    Object? completedCount = null,
    Object? avatar = freezed,
  }) {
    return _then(
      _value.copyWith(
            memberId: null == memberId
                ? _value.memberId
                : memberId // ignore: cast_nullable_to_non_nullable
                      as String,
            memberName: null == memberName
                ? _value.memberName
                : memberName // ignore: cast_nullable_to_non_nullable
                      as String,
            assignedCount: null == assignedCount
                ? _value.assignedCount
                : assignedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            completedCount: null == completedCount
                ? _value.completedCount
                : completedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkloadItemImplCopyWith<$Res>
    implements $WorkloadItemCopyWith<$Res> {
  factory _$$WorkloadItemImplCopyWith(
    _$WorkloadItemImpl value,
    $Res Function(_$WorkloadItemImpl) then,
  ) = __$$WorkloadItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String memberId,
    String memberName,
    int assignedCount,
    int completedCount,
    String? avatar,
  });
}

/// @nodoc
class __$$WorkloadItemImplCopyWithImpl<$Res>
    extends _$WorkloadItemCopyWithImpl<$Res, _$WorkloadItemImpl>
    implements _$$WorkloadItemImplCopyWith<$Res> {
  __$$WorkloadItemImplCopyWithImpl(
    _$WorkloadItemImpl _value,
    $Res Function(_$WorkloadItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkloadItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? memberName = null,
    Object? assignedCount = null,
    Object? completedCount = null,
    Object? avatar = freezed,
  }) {
    return _then(
      _$WorkloadItemImpl(
        memberId: null == memberId
            ? _value.memberId
            : memberId // ignore: cast_nullable_to_non_nullable
                  as String,
        memberName: null == memberName
            ? _value.memberName
            : memberName // ignore: cast_nullable_to_non_nullable
                  as String,
        assignedCount: null == assignedCount
            ? _value.assignedCount
            : assignedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        completedCount: null == completedCount
            ? _value.completedCount
            : completedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkloadItemImpl implements _WorkloadItem {
  const _$WorkloadItemImpl({
    required this.memberId,
    required this.memberName,
    required this.assignedCount,
    required this.completedCount,
    this.avatar,
  });

  factory _$WorkloadItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkloadItemImplFromJson(json);

  @override
  final String memberId;
  @override
  final String memberName;
  @override
  final int assignedCount;
  @override
  final int completedCount;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'WorkloadItem(memberId: $memberId, memberName: $memberName, assignedCount: $assignedCount, completedCount: $completedCount, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkloadItemImpl &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.memberName, memberName) ||
                other.memberName == memberName) &&
            (identical(other.assignedCount, assignedCount) ||
                other.assignedCount == assignedCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    memberId,
    memberName,
    assignedCount,
    completedCount,
    avatar,
  );

  /// Create a copy of WorkloadItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkloadItemImplCopyWith<_$WorkloadItemImpl> get copyWith =>
      __$$WorkloadItemImplCopyWithImpl<_$WorkloadItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkloadItemImplToJson(this);
  }
}

abstract class _WorkloadItem implements WorkloadItem {
  const factory _WorkloadItem({
    required final String memberId,
    required final String memberName,
    required final int assignedCount,
    required final int completedCount,
    final String? avatar,
  }) = _$WorkloadItemImpl;

  factory _WorkloadItem.fromJson(Map<String, dynamic> json) =
      _$WorkloadItemImpl.fromJson;

  @override
  String get memberId;
  @override
  String get memberName;
  @override
  int get assignedCount;
  @override
  int get completedCount;
  @override
  String? get avatar;

  /// Create a copy of WorkloadItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkloadItemImplCopyWith<_$WorkloadItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

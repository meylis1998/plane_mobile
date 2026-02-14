// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkItemFilter _$WorkItemFilterFromJson(Map<String, dynamic> json) {
  return _WorkItemFilter.fromJson(json);
}

/// @nodoc
mixin _$WorkItemFilter {
  List<StateGroup> get stateGroups => throw _privateConstructorUsedError;
  List<Priority> get priorities => throw _privateConstructorUsedError;
  List<String> get assigneeIds => throw _privateConstructorUsedError;
  List<String> get labelIds => throw _privateConstructorUsedError;

  /// Serializes this WorkItemFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkItemFilterCopyWith<WorkItemFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkItemFilterCopyWith<$Res> {
  factory $WorkItemFilterCopyWith(
    WorkItemFilter value,
    $Res Function(WorkItemFilter) then,
  ) = _$WorkItemFilterCopyWithImpl<$Res, WorkItemFilter>;
  @useResult
  $Res call({
    List<StateGroup> stateGroups,
    List<Priority> priorities,
    List<String> assigneeIds,
    List<String> labelIds,
  });
}

/// @nodoc
class _$WorkItemFilterCopyWithImpl<$Res, $Val extends WorkItemFilter>
    implements $WorkItemFilterCopyWith<$Res> {
  _$WorkItemFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateGroups = null,
    Object? priorities = null,
    Object? assigneeIds = null,
    Object? labelIds = null,
  }) {
    return _then(
      _value.copyWith(
            stateGroups: null == stateGroups
                ? _value.stateGroups
                : stateGroups // ignore: cast_nullable_to_non_nullable
                      as List<StateGroup>,
            priorities: null == priorities
                ? _value.priorities
                : priorities // ignore: cast_nullable_to_non_nullable
                      as List<Priority>,
            assigneeIds: null == assigneeIds
                ? _value.assigneeIds
                : assigneeIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            labelIds: null == labelIds
                ? _value.labelIds
                : labelIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkItemFilterImplCopyWith<$Res>
    implements $WorkItemFilterCopyWith<$Res> {
  factory _$$WorkItemFilterImplCopyWith(
    _$WorkItemFilterImpl value,
    $Res Function(_$WorkItemFilterImpl) then,
  ) = __$$WorkItemFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<StateGroup> stateGroups,
    List<Priority> priorities,
    List<String> assigneeIds,
    List<String> labelIds,
  });
}

/// @nodoc
class __$$WorkItemFilterImplCopyWithImpl<$Res>
    extends _$WorkItemFilterCopyWithImpl<$Res, _$WorkItemFilterImpl>
    implements _$$WorkItemFilterImplCopyWith<$Res> {
  __$$WorkItemFilterImplCopyWithImpl(
    _$WorkItemFilterImpl _value,
    $Res Function(_$WorkItemFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateGroups = null,
    Object? priorities = null,
    Object? assigneeIds = null,
    Object? labelIds = null,
  }) {
    return _then(
      _$WorkItemFilterImpl(
        stateGroups: null == stateGroups
            ? _value._stateGroups
            : stateGroups // ignore: cast_nullable_to_non_nullable
                  as List<StateGroup>,
        priorities: null == priorities
            ? _value._priorities
            : priorities // ignore: cast_nullable_to_non_nullable
                  as List<Priority>,
        assigneeIds: null == assigneeIds
            ? _value._assigneeIds
            : assigneeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        labelIds: null == labelIds
            ? _value._labelIds
            : labelIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkItemFilterImpl extends _WorkItemFilter {
  const _$WorkItemFilterImpl({
    final List<StateGroup> stateGroups = const [],
    final List<Priority> priorities = const [],
    final List<String> assigneeIds = const [],
    final List<String> labelIds = const [],
  }) : _stateGroups = stateGroups,
       _priorities = priorities,
       _assigneeIds = assigneeIds,
       _labelIds = labelIds,
       super._();

  factory _$WorkItemFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemFilterImplFromJson(json);

  final List<StateGroup> _stateGroups;
  @override
  @JsonKey()
  List<StateGroup> get stateGroups {
    if (_stateGroups is EqualUnmodifiableListView) return _stateGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stateGroups);
  }

  final List<Priority> _priorities;
  @override
  @JsonKey()
  List<Priority> get priorities {
    if (_priorities is EqualUnmodifiableListView) return _priorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priorities);
  }

  final List<String> _assigneeIds;
  @override
  @JsonKey()
  List<String> get assigneeIds {
    if (_assigneeIds is EqualUnmodifiableListView) return _assigneeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assigneeIds);
  }

  final List<String> _labelIds;
  @override
  @JsonKey()
  List<String> get labelIds {
    if (_labelIds is EqualUnmodifiableListView) return _labelIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labelIds);
  }

  @override
  String toString() {
    return 'WorkItemFilter(stateGroups: $stateGroups, priorities: $priorities, assigneeIds: $assigneeIds, labelIds: $labelIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemFilterImpl &&
            const DeepCollectionEquality().equals(
              other._stateGroups,
              _stateGroups,
            ) &&
            const DeepCollectionEquality().equals(
              other._priorities,
              _priorities,
            ) &&
            const DeepCollectionEquality().equals(
              other._assigneeIds,
              _assigneeIds,
            ) &&
            const DeepCollectionEquality().equals(other._labelIds, _labelIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_stateGroups),
    const DeepCollectionEquality().hash(_priorities),
    const DeepCollectionEquality().hash(_assigneeIds),
    const DeepCollectionEquality().hash(_labelIds),
  );

  /// Create a copy of WorkItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemFilterImplCopyWith<_$WorkItemFilterImpl> get copyWith =>
      __$$WorkItemFilterImplCopyWithImpl<_$WorkItemFilterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkItemFilterImplToJson(this);
  }
}

abstract class _WorkItemFilter extends WorkItemFilter {
  const factory _WorkItemFilter({
    final List<StateGroup> stateGroups,
    final List<Priority> priorities,
    final List<String> assigneeIds,
    final List<String> labelIds,
  }) = _$WorkItemFilterImpl;
  const _WorkItemFilter._() : super._();

  factory _WorkItemFilter.fromJson(Map<String, dynamic> json) =
      _$WorkItemFilterImpl.fromJson;

  @override
  List<StateGroup> get stateGroups;
  @override
  List<Priority> get priorities;
  @override
  List<String> get assigneeIds;
  @override
  List<String> get labelIds;

  /// Create a copy of WorkItemFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemFilterImplCopyWith<_$WorkItemFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

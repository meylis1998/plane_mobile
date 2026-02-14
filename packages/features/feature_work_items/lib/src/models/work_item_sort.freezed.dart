// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_item_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkItemSort _$WorkItemSortFromJson(Map<String, dynamic> json) {
  return _WorkItemSort.fromJson(json);
}

/// @nodoc
mixin _$WorkItemSort {
  SortField get field => throw _privateConstructorUsedError;
  SortDirection get direction => throw _privateConstructorUsedError;

  /// Serializes this WorkItemSort to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkItemSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkItemSortCopyWith<WorkItemSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkItemSortCopyWith<$Res> {
  factory $WorkItemSortCopyWith(
    WorkItemSort value,
    $Res Function(WorkItemSort) then,
  ) = _$WorkItemSortCopyWithImpl<$Res, WorkItemSort>;
  @useResult
  $Res call({SortField field, SortDirection direction});
}

/// @nodoc
class _$WorkItemSortCopyWithImpl<$Res, $Val extends WorkItemSort>
    implements $WorkItemSortCopyWith<$Res> {
  _$WorkItemSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkItemSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? field = null, Object? direction = null}) {
    return _then(
      _value.copyWith(
            field: null == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as SortField,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as SortDirection,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkItemSortImplCopyWith<$Res>
    implements $WorkItemSortCopyWith<$Res> {
  factory _$$WorkItemSortImplCopyWith(
    _$WorkItemSortImpl value,
    $Res Function(_$WorkItemSortImpl) then,
  ) = __$$WorkItemSortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortField field, SortDirection direction});
}

/// @nodoc
class __$$WorkItemSortImplCopyWithImpl<$Res>
    extends _$WorkItemSortCopyWithImpl<$Res, _$WorkItemSortImpl>
    implements _$$WorkItemSortImplCopyWith<$Res> {
  __$$WorkItemSortImplCopyWithImpl(
    _$WorkItemSortImpl _value,
    $Res Function(_$WorkItemSortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkItemSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? field = null, Object? direction = null}) {
    return _then(
      _$WorkItemSortImpl(
        field: null == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as SortField,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as SortDirection,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkItemSortImpl extends _WorkItemSort {
  const _$WorkItemSortImpl({
    this.field = SortField.sortOrder,
    this.direction = SortDirection.ascending,
  }) : super._();

  factory _$WorkItemSortImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemSortImplFromJson(json);

  @override
  @JsonKey()
  final SortField field;
  @override
  @JsonKey()
  final SortDirection direction;

  @override
  String toString() {
    return 'WorkItemSort(field: $field, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemSortImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, field, direction);

  /// Create a copy of WorkItemSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemSortImplCopyWith<_$WorkItemSortImpl> get copyWith =>
      __$$WorkItemSortImplCopyWithImpl<_$WorkItemSortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkItemSortImplToJson(this);
  }
}

abstract class _WorkItemSort extends WorkItemSort {
  const factory _WorkItemSort({
    final SortField field,
    final SortDirection direction,
  }) = _$WorkItemSortImpl;
  const _WorkItemSort._() : super._();

  factory _WorkItemSort.fromJson(Map<String, dynamic> json) =
      _$WorkItemSortImpl.fromJson;

  @override
  SortField get field;
  @override
  SortDirection get direction;

  /// Create a copy of WorkItemSort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkItemSortImplCopyWith<_$WorkItemSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ModuleFilter _$ModuleFilterFromJson(Map<String, dynamic> json) {
  return _ModuleFilter.fromJson(json);
}

/// @nodoc
mixin _$ModuleFilter {
  List<ModuleStatus> get statuses => throw _privateConstructorUsedError;

  /// Serializes this ModuleFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModuleFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleFilterCopyWith<ModuleFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleFilterCopyWith<$Res> {
  factory $ModuleFilterCopyWith(
    ModuleFilter value,
    $Res Function(ModuleFilter) then,
  ) = _$ModuleFilterCopyWithImpl<$Res, ModuleFilter>;
  @useResult
  $Res call({List<ModuleStatus> statuses});
}

/// @nodoc
class _$ModuleFilterCopyWithImpl<$Res, $Val extends ModuleFilter>
    implements $ModuleFilterCopyWith<$Res> {
  _$ModuleFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModuleFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? statuses = null}) {
    return _then(
      _value.copyWith(
            statuses: null == statuses
                ? _value.statuses
                : statuses // ignore: cast_nullable_to_non_nullable
                      as List<ModuleStatus>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ModuleFilterImplCopyWith<$Res>
    implements $ModuleFilterCopyWith<$Res> {
  factory _$$ModuleFilterImplCopyWith(
    _$ModuleFilterImpl value,
    $Res Function(_$ModuleFilterImpl) then,
  ) = __$$ModuleFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ModuleStatus> statuses});
}

/// @nodoc
class __$$ModuleFilterImplCopyWithImpl<$Res>
    extends _$ModuleFilterCopyWithImpl<$Res, _$ModuleFilterImpl>
    implements _$$ModuleFilterImplCopyWith<$Res> {
  __$$ModuleFilterImplCopyWithImpl(
    _$ModuleFilterImpl _value,
    $Res Function(_$ModuleFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ModuleFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? statuses = null}) {
    return _then(
      _$ModuleFilterImpl(
        statuses: null == statuses
            ? _value._statuses
            : statuses // ignore: cast_nullable_to_non_nullable
                  as List<ModuleStatus>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleFilterImpl extends _ModuleFilter {
  const _$ModuleFilterImpl({final List<ModuleStatus> statuses = const []})
    : _statuses = statuses,
      super._();

  factory _$ModuleFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleFilterImplFromJson(json);

  final List<ModuleStatus> _statuses;
  @override
  @JsonKey()
  List<ModuleStatus> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  String toString() {
    return 'ModuleFilter(statuses: $statuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleFilterImpl &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_statuses));

  /// Create a copy of ModuleFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleFilterImplCopyWith<_$ModuleFilterImpl> get copyWith =>
      __$$ModuleFilterImplCopyWithImpl<_$ModuleFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleFilterImplToJson(this);
  }
}

abstract class _ModuleFilter extends ModuleFilter {
  const factory _ModuleFilter({final List<ModuleStatus> statuses}) =
      _$ModuleFilterImpl;
  const _ModuleFilter._() : super._();

  factory _ModuleFilter.fromJson(Map<String, dynamic> json) =
      _$ModuleFilterImpl.fromJson;

  @override
  List<ModuleStatus> get statuses;

  /// Create a copy of ModuleFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleFilterImplCopyWith<_$ModuleFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

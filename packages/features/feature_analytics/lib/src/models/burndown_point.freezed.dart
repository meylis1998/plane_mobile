// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'burndown_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BurndownPoint _$BurndownPointFromJson(Map<String, dynamic> json) {
  return _BurndownPoint.fromJson(json);
}

/// @nodoc
mixin _$BurndownPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get ideal => throw _privateConstructorUsedError;
  double get actual => throw _privateConstructorUsedError;

  /// Serializes this BurndownPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BurndownPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BurndownPointCopyWith<BurndownPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BurndownPointCopyWith<$Res> {
  factory $BurndownPointCopyWith(
    BurndownPoint value,
    $Res Function(BurndownPoint) then,
  ) = _$BurndownPointCopyWithImpl<$Res, BurndownPoint>;
  @useResult
  $Res call({DateTime date, double ideal, double actual});
}

/// @nodoc
class _$BurndownPointCopyWithImpl<$Res, $Val extends BurndownPoint>
    implements $BurndownPointCopyWith<$Res> {
  _$BurndownPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BurndownPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? ideal = null,
    Object? actual = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            ideal: null == ideal
                ? _value.ideal
                : ideal // ignore: cast_nullable_to_non_nullable
                      as double,
            actual: null == actual
                ? _value.actual
                : actual // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BurndownPointImplCopyWith<$Res>
    implements $BurndownPointCopyWith<$Res> {
  factory _$$BurndownPointImplCopyWith(
    _$BurndownPointImpl value,
    $Res Function(_$BurndownPointImpl) then,
  ) = __$$BurndownPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double ideal, double actual});
}

/// @nodoc
class __$$BurndownPointImplCopyWithImpl<$Res>
    extends _$BurndownPointCopyWithImpl<$Res, _$BurndownPointImpl>
    implements _$$BurndownPointImplCopyWith<$Res> {
  __$$BurndownPointImplCopyWithImpl(
    _$BurndownPointImpl _value,
    $Res Function(_$BurndownPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BurndownPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? ideal = null,
    Object? actual = null,
  }) {
    return _then(
      _$BurndownPointImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        ideal: null == ideal
            ? _value.ideal
            : ideal // ignore: cast_nullable_to_non_nullable
                  as double,
        actual: null == actual
            ? _value.actual
            : actual // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BurndownPointImpl implements _BurndownPoint {
  const _$BurndownPointImpl({
    required this.date,
    required this.ideal,
    required this.actual,
  });

  factory _$BurndownPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$BurndownPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double ideal;
  @override
  final double actual;

  @override
  String toString() {
    return 'BurndownPoint(date: $date, ideal: $ideal, actual: $actual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BurndownPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.ideal, ideal) || other.ideal == ideal) &&
            (identical(other.actual, actual) || other.actual == actual));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, ideal, actual);

  /// Create a copy of BurndownPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BurndownPointImplCopyWith<_$BurndownPointImpl> get copyWith =>
      __$$BurndownPointImplCopyWithImpl<_$BurndownPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BurndownPointImplToJson(this);
  }
}

abstract class _BurndownPoint implements BurndownPoint {
  const factory _BurndownPoint({
    required final DateTime date,
    required final double ideal,
    required final double actual,
  }) = _$BurndownPointImpl;

  factory _BurndownPoint.fromJson(Map<String, dynamic> json) =
      _$BurndownPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get ideal;
  @override
  double get actual;

  /// Create a copy of BurndownPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BurndownPointImplCopyWith<_$BurndownPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

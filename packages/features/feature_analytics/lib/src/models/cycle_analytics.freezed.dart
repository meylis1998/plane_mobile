// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CycleAnalytics _$CycleAnalyticsFromJson(Map<String, dynamic> json) {
  return _CycleAnalytics.fromJson(json);
}

/// @nodoc
mixin _$CycleAnalytics {
  double get velocity => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  List<BurndownPoint> get burndownData => throw _privateConstructorUsedError;
  Map<StateGroup, int> get issuesByState => throw _privateConstructorUsedError;

  /// Serializes this CycleAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CycleAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CycleAnalyticsCopyWith<CycleAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleAnalyticsCopyWith<$Res> {
  factory $CycleAnalyticsCopyWith(
    CycleAnalytics value,
    $Res Function(CycleAnalytics) then,
  ) = _$CycleAnalyticsCopyWithImpl<$Res, CycleAnalytics>;
  @useResult
  $Res call({
    double velocity,
    double completionRate,
    List<BurndownPoint> burndownData,
    Map<StateGroup, int> issuesByState,
  });
}

/// @nodoc
class _$CycleAnalyticsCopyWithImpl<$Res, $Val extends CycleAnalytics>
    implements $CycleAnalyticsCopyWith<$Res> {
  _$CycleAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CycleAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? velocity = null,
    Object? completionRate = null,
    Object? burndownData = null,
    Object? issuesByState = null,
  }) {
    return _then(
      _value.copyWith(
            velocity: null == velocity
                ? _value.velocity
                : velocity // ignore: cast_nullable_to_non_nullable
                      as double,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            burndownData: null == burndownData
                ? _value.burndownData
                : burndownData // ignore: cast_nullable_to_non_nullable
                      as List<BurndownPoint>,
            issuesByState: null == issuesByState
                ? _value.issuesByState
                : issuesByState // ignore: cast_nullable_to_non_nullable
                      as Map<StateGroup, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CycleAnalyticsImplCopyWith<$Res>
    implements $CycleAnalyticsCopyWith<$Res> {
  factory _$$CycleAnalyticsImplCopyWith(
    _$CycleAnalyticsImpl value,
    $Res Function(_$CycleAnalyticsImpl) then,
  ) = __$$CycleAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double velocity,
    double completionRate,
    List<BurndownPoint> burndownData,
    Map<StateGroup, int> issuesByState,
  });
}

/// @nodoc
class __$$CycleAnalyticsImplCopyWithImpl<$Res>
    extends _$CycleAnalyticsCopyWithImpl<$Res, _$CycleAnalyticsImpl>
    implements _$$CycleAnalyticsImplCopyWith<$Res> {
  __$$CycleAnalyticsImplCopyWithImpl(
    _$CycleAnalyticsImpl _value,
    $Res Function(_$CycleAnalyticsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CycleAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? velocity = null,
    Object? completionRate = null,
    Object? burndownData = null,
    Object? issuesByState = null,
  }) {
    return _then(
      _$CycleAnalyticsImpl(
        velocity: null == velocity
            ? _value.velocity
            : velocity // ignore: cast_nullable_to_non_nullable
                  as double,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        burndownData: null == burndownData
            ? _value._burndownData
            : burndownData // ignore: cast_nullable_to_non_nullable
                  as List<BurndownPoint>,
        issuesByState: null == issuesByState
            ? _value._issuesByState
            : issuesByState // ignore: cast_nullable_to_non_nullable
                  as Map<StateGroup, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CycleAnalyticsImpl implements _CycleAnalytics {
  const _$CycleAnalyticsImpl({
    required this.velocity,
    required this.completionRate,
    required final List<BurndownPoint> burndownData,
    required final Map<StateGroup, int> issuesByState,
  }) : _burndownData = burndownData,
       _issuesByState = issuesByState;

  factory _$CycleAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleAnalyticsImplFromJson(json);

  @override
  final double velocity;
  @override
  final double completionRate;
  final List<BurndownPoint> _burndownData;
  @override
  List<BurndownPoint> get burndownData {
    if (_burndownData is EqualUnmodifiableListView) return _burndownData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_burndownData);
  }

  final Map<StateGroup, int> _issuesByState;
  @override
  Map<StateGroup, int> get issuesByState {
    if (_issuesByState is EqualUnmodifiableMapView) return _issuesByState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_issuesByState);
  }

  @override
  String toString() {
    return 'CycleAnalytics(velocity: $velocity, completionRate: $completionRate, burndownData: $burndownData, issuesByState: $issuesByState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleAnalyticsImpl &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            const DeepCollectionEquality().equals(
              other._burndownData,
              _burndownData,
            ) &&
            const DeepCollectionEquality().equals(
              other._issuesByState,
              _issuesByState,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    velocity,
    completionRate,
    const DeepCollectionEquality().hash(_burndownData),
    const DeepCollectionEquality().hash(_issuesByState),
  );

  /// Create a copy of CycleAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleAnalyticsImplCopyWith<_$CycleAnalyticsImpl> get copyWith =>
      __$$CycleAnalyticsImplCopyWithImpl<_$CycleAnalyticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleAnalyticsImplToJson(this);
  }
}

abstract class _CycleAnalytics implements CycleAnalytics {
  const factory _CycleAnalytics({
    required final double velocity,
    required final double completionRate,
    required final List<BurndownPoint> burndownData,
    required final Map<StateGroup, int> issuesByState,
  }) = _$CycleAnalyticsImpl;

  factory _CycleAnalytics.fromJson(Map<String, dynamic> json) =
      _$CycleAnalyticsImpl.fromJson;

  @override
  double get velocity;
  @override
  double get completionRate;
  @override
  List<BurndownPoint> get burndownData;
  @override
  Map<StateGroup, int> get issuesByState;

  /// Create a copy of CycleAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CycleAnalyticsImplCopyWith<_$CycleAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

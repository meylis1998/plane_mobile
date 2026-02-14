// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CycleProgress _$CycleProgressFromJson(Map<String, dynamic> json) {
  return _CycleProgress.fromJson(json);
}

/// @nodoc
mixin _$CycleProgress {
  DateTime get date => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this CycleProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CycleProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CycleProgressCopyWith<CycleProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleProgressCopyWith<$Res> {
  factory $CycleProgressCopyWith(
    CycleProgress value,
    $Res Function(CycleProgress) then,
  ) = _$CycleProgressCopyWithImpl<$Res, CycleProgress>;
  @useResult
  $Res call({DateTime date, int completed, int total});
}

/// @nodoc
class _$CycleProgressCopyWithImpl<$Res, $Val extends CycleProgress>
    implements $CycleProgressCopyWith<$Res> {
  _$CycleProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CycleProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? completed = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CycleProgressImplCopyWith<$Res>
    implements $CycleProgressCopyWith<$Res> {
  factory _$$CycleProgressImplCopyWith(
    _$CycleProgressImpl value,
    $Res Function(_$CycleProgressImpl) then,
  ) = __$$CycleProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int completed, int total});
}

/// @nodoc
class __$$CycleProgressImplCopyWithImpl<$Res>
    extends _$CycleProgressCopyWithImpl<$Res, _$CycleProgressImpl>
    implements _$$CycleProgressImplCopyWith<$Res> {
  __$$CycleProgressImplCopyWithImpl(
    _$CycleProgressImpl _value,
    $Res Function(_$CycleProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CycleProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? completed = null,
    Object? total = null,
  }) {
    return _then(
      _$CycleProgressImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CycleProgressImpl implements _CycleProgress {
  const _$CycleProgressImpl({
    required this.date,
    required this.completed,
    required this.total,
  });

  factory _$CycleProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleProgressImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int completed;
  @override
  final int total;

  @override
  String toString() {
    return 'CycleProgress(date: $date, completed: $completed, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleProgressImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, completed, total);

  /// Create a copy of CycleProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleProgressImplCopyWith<_$CycleProgressImpl> get copyWith =>
      __$$CycleProgressImplCopyWithImpl<_$CycleProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleProgressImplToJson(this);
  }
}

abstract class _CycleProgress implements CycleProgress {
  const factory _CycleProgress({
    required final DateTime date,
    required final int completed,
    required final int total,
  }) = _$CycleProgressImpl;

  factory _CycleProgress.fromJson(Map<String, dynamic> json) =
      _$CycleProgressImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get completed;
  @override
  int get total;

  /// Create a copy of CycleProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CycleProgressImplCopyWith<_$CycleProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

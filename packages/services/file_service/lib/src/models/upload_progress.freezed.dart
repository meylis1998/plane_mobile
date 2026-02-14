// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UploadProgress _$UploadProgressFromJson(Map<String, dynamic> json) {
  return _UploadProgress.fromJson(json);
}

/// @nodoc
mixin _$UploadProgress {
  String get fileName => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this UploadProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadProgressCopyWith<UploadProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProgressCopyWith<$Res> {
  factory $UploadProgressCopyWith(
    UploadProgress value,
    $Res Function(UploadProgress) then,
  ) = _$UploadProgressCopyWithImpl<$Res, UploadProgress>;
  @useResult
  $Res call({String fileName, double progress, bool isComplete, String? error});
}

/// @nodoc
class _$UploadProgressCopyWithImpl<$Res, $Val extends UploadProgress>
    implements $UploadProgressCopyWith<$Res> {
  _$UploadProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? progress = null,
    Object? isComplete = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            fileName: null == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double,
            isComplete: null == isComplete
                ? _value.isComplete
                : isComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadProgressImplCopyWith<$Res>
    implements $UploadProgressCopyWith<$Res> {
  factory _$$UploadProgressImplCopyWith(
    _$UploadProgressImpl value,
    $Res Function(_$UploadProgressImpl) then,
  ) = __$$UploadProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileName, double progress, bool isComplete, String? error});
}

/// @nodoc
class __$$UploadProgressImplCopyWithImpl<$Res>
    extends _$UploadProgressCopyWithImpl<$Res, _$UploadProgressImpl>
    implements _$$UploadProgressImplCopyWith<$Res> {
  __$$UploadProgressImplCopyWithImpl(
    _$UploadProgressImpl _value,
    $Res Function(_$UploadProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? progress = null,
    Object? isComplete = null,
    Object? error = freezed,
  }) {
    return _then(
      _$UploadProgressImpl(
        fileName: null == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        isComplete: null == isComplete
            ? _value.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadProgressImpl implements _UploadProgress {
  const _$UploadProgressImpl({
    required this.fileName,
    this.progress = 0.0,
    this.isComplete = false,
    this.error,
  });

  factory _$UploadProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadProgressImplFromJson(json);

  @override
  final String fileName;
  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  final String? error;

  @override
  String toString() {
    return 'UploadProgress(fileName: $fileName, progress: $progress, isComplete: $isComplete, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProgressImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fileName, progress, isComplete, error);

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProgressImplCopyWith<_$UploadProgressImpl> get copyWith =>
      __$$UploadProgressImplCopyWithImpl<_$UploadProgressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadProgressImplToJson(this);
  }
}

abstract class _UploadProgress implements UploadProgress {
  const factory _UploadProgress({
    required final String fileName,
    final double progress,
    final bool isComplete,
    final String? error,
  }) = _$UploadProgressImpl;

  factory _UploadProgress.fromJson(Map<String, dynamic> json) =
      _$UploadProgressImpl.fromJson;

  @override
  String get fileName;
  @override
  double get progress;
  @override
  bool get isComplete;
  @override
  String? get error;

  /// Create a copy of UploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadProgressImplCopyWith<_$UploadProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

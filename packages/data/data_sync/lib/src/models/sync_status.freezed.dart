// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SyncStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress) syncing,
    required TResult Function(String message) error,
    required TResult Function(int syncedCount) completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress)? syncing,
    TResult? Function(String message)? error,
    TResult? Function(int syncedCount)? completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress)? syncing,
    TResult Function(String message)? error,
    TResult Function(int syncedCount)? completed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncStatusIdle value) idle,
    required TResult Function(SyncStatusSyncing value) syncing,
    required TResult Function(SyncStatusError value) error,
    required TResult Function(SyncStatusCompleted value) completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncStatusIdle value)? idle,
    TResult? Function(SyncStatusSyncing value)? syncing,
    TResult? Function(SyncStatusError value)? error,
    TResult? Function(SyncStatusCompleted value)? completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncStatusIdle value)? idle,
    TResult Function(SyncStatusSyncing value)? syncing,
    TResult Function(SyncStatusError value)? error,
    TResult Function(SyncStatusCompleted value)? completed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStatusCopyWith<$Res> {
  factory $SyncStatusCopyWith(
    SyncStatus value,
    $Res Function(SyncStatus) then,
  ) = _$SyncStatusCopyWithImpl<$Res, SyncStatus>;
}

/// @nodoc
class _$SyncStatusCopyWithImpl<$Res, $Val extends SyncStatus>
    implements $SyncStatusCopyWith<$Res> {
  _$SyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SyncStatusIdleImplCopyWith<$Res> {
  factory _$$SyncStatusIdleImplCopyWith(
    _$SyncStatusIdleImpl value,
    $Res Function(_$SyncStatusIdleImpl) then,
  ) = __$$SyncStatusIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncStatusIdleImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncStatusIdleImpl>
    implements _$$SyncStatusIdleImplCopyWith<$Res> {
  __$$SyncStatusIdleImplCopyWithImpl(
    _$SyncStatusIdleImpl _value,
    $Res Function(_$SyncStatusIdleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncStatusIdleImpl implements SyncStatusIdle {
  const _$SyncStatusIdleImpl();

  @override
  String toString() {
    return 'SyncStatus.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncStatusIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress) syncing,
    required TResult Function(String message) error,
    required TResult Function(int syncedCount) completed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress)? syncing,
    TResult? Function(String message)? error,
    TResult? Function(int syncedCount)? completed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress)? syncing,
    TResult Function(String message)? error,
    TResult Function(int syncedCount)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncStatusIdle value) idle,
    required TResult Function(SyncStatusSyncing value) syncing,
    required TResult Function(SyncStatusError value) error,
    required TResult Function(SyncStatusCompleted value) completed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncStatusIdle value)? idle,
    TResult? Function(SyncStatusSyncing value)? syncing,
    TResult? Function(SyncStatusError value)? error,
    TResult? Function(SyncStatusCompleted value)? completed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncStatusIdle value)? idle,
    TResult Function(SyncStatusSyncing value)? syncing,
    TResult Function(SyncStatusError value)? error,
    TResult Function(SyncStatusCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class SyncStatusIdle implements SyncStatus {
  const factory SyncStatusIdle() = _$SyncStatusIdleImpl;
}

/// @nodoc
abstract class _$$SyncStatusSyncingImplCopyWith<$Res> {
  factory _$$SyncStatusSyncingImplCopyWith(
    _$SyncStatusSyncingImpl value,
    $Res Function(_$SyncStatusSyncingImpl) then,
  ) = __$$SyncStatusSyncingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class __$$SyncStatusSyncingImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncStatusSyncingImpl>
    implements _$$SyncStatusSyncingImplCopyWith<$Res> {
  __$$SyncStatusSyncingImplCopyWithImpl(
    _$SyncStatusSyncingImpl _value,
    $Res Function(_$SyncStatusSyncingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? progress = null}) {
    return _then(
      _$SyncStatusSyncingImpl(
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$SyncStatusSyncingImpl implements SyncStatusSyncing {
  const _$SyncStatusSyncingImpl({this.progress = 0.0});

  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'SyncStatus.syncing(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatusSyncingImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatusSyncingImplCopyWith<_$SyncStatusSyncingImpl> get copyWith =>
      __$$SyncStatusSyncingImplCopyWithImpl<_$SyncStatusSyncingImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress) syncing,
    required TResult Function(String message) error,
    required TResult Function(int syncedCount) completed,
  }) {
    return syncing(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress)? syncing,
    TResult? Function(String message)? error,
    TResult? Function(int syncedCount)? completed,
  }) {
    return syncing?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress)? syncing,
    TResult Function(String message)? error,
    TResult Function(int syncedCount)? completed,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncStatusIdle value) idle,
    required TResult Function(SyncStatusSyncing value) syncing,
    required TResult Function(SyncStatusError value) error,
    required TResult Function(SyncStatusCompleted value) completed,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncStatusIdle value)? idle,
    TResult? Function(SyncStatusSyncing value)? syncing,
    TResult? Function(SyncStatusError value)? error,
    TResult? Function(SyncStatusCompleted value)? completed,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncStatusIdle value)? idle,
    TResult Function(SyncStatusSyncing value)? syncing,
    TResult Function(SyncStatusError value)? error,
    TResult Function(SyncStatusCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class SyncStatusSyncing implements SyncStatus {
  const factory SyncStatusSyncing({final double progress}) =
      _$SyncStatusSyncingImpl;

  double get progress;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStatusSyncingImplCopyWith<_$SyncStatusSyncingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncStatusErrorImplCopyWith<$Res> {
  factory _$$SyncStatusErrorImplCopyWith(
    _$SyncStatusErrorImpl value,
    $Res Function(_$SyncStatusErrorImpl) then,
  ) = __$$SyncStatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SyncStatusErrorImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncStatusErrorImpl>
    implements _$$SyncStatusErrorImplCopyWith<$Res> {
  __$$SyncStatusErrorImplCopyWithImpl(
    _$SyncStatusErrorImpl _value,
    $Res Function(_$SyncStatusErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SyncStatusErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SyncStatusErrorImpl implements SyncStatusError {
  const _$SyncStatusErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SyncStatus.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatusErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatusErrorImplCopyWith<_$SyncStatusErrorImpl> get copyWith =>
      __$$SyncStatusErrorImplCopyWithImpl<_$SyncStatusErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress) syncing,
    required TResult Function(String message) error,
    required TResult Function(int syncedCount) completed,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress)? syncing,
    TResult? Function(String message)? error,
    TResult? Function(int syncedCount)? completed,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress)? syncing,
    TResult Function(String message)? error,
    TResult Function(int syncedCount)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncStatusIdle value) idle,
    required TResult Function(SyncStatusSyncing value) syncing,
    required TResult Function(SyncStatusError value) error,
    required TResult Function(SyncStatusCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncStatusIdle value)? idle,
    TResult? Function(SyncStatusSyncing value)? syncing,
    TResult? Function(SyncStatusError value)? error,
    TResult? Function(SyncStatusCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncStatusIdle value)? idle,
    TResult Function(SyncStatusSyncing value)? syncing,
    TResult Function(SyncStatusError value)? error,
    TResult Function(SyncStatusCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SyncStatusError implements SyncStatus {
  const factory SyncStatusError({required final String message}) =
      _$SyncStatusErrorImpl;

  String get message;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStatusErrorImplCopyWith<_$SyncStatusErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncStatusCompletedImplCopyWith<$Res> {
  factory _$$SyncStatusCompletedImplCopyWith(
    _$SyncStatusCompletedImpl value,
    $Res Function(_$SyncStatusCompletedImpl) then,
  ) = __$$SyncStatusCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int syncedCount});
}

/// @nodoc
class __$$SyncStatusCompletedImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncStatusCompletedImpl>
    implements _$$SyncStatusCompletedImplCopyWith<$Res> {
  __$$SyncStatusCompletedImplCopyWithImpl(
    _$SyncStatusCompletedImpl _value,
    $Res Function(_$SyncStatusCompletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? syncedCount = null}) {
    return _then(
      _$SyncStatusCompletedImpl(
        syncedCount: null == syncedCount
            ? _value.syncedCount
            : syncedCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SyncStatusCompletedImpl implements SyncStatusCompleted {
  const _$SyncStatusCompletedImpl({this.syncedCount = 0});

  @override
  @JsonKey()
  final int syncedCount;

  @override
  String toString() {
    return 'SyncStatus.completed(syncedCount: $syncedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatusCompletedImpl &&
            (identical(other.syncedCount, syncedCount) ||
                other.syncedCount == syncedCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncedCount);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatusCompletedImplCopyWith<_$SyncStatusCompletedImpl> get copyWith =>
      __$$SyncStatusCompletedImplCopyWithImpl<_$SyncStatusCompletedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress) syncing,
    required TResult Function(String message) error,
    required TResult Function(int syncedCount) completed,
  }) {
    return completed(syncedCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress)? syncing,
    TResult? Function(String message)? error,
    TResult? Function(int syncedCount)? completed,
  }) {
    return completed?.call(syncedCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress)? syncing,
    TResult Function(String message)? error,
    TResult Function(int syncedCount)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(syncedCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncStatusIdle value) idle,
    required TResult Function(SyncStatusSyncing value) syncing,
    required TResult Function(SyncStatusError value) error,
    required TResult Function(SyncStatusCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncStatusIdle value)? idle,
    TResult? Function(SyncStatusSyncing value)? syncing,
    TResult? Function(SyncStatusError value)? error,
    TResult? Function(SyncStatusCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncStatusIdle value)? idle,
    TResult Function(SyncStatusSyncing value)? syncing,
    TResult Function(SyncStatusError value)? error,
    TResult Function(SyncStatusCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class SyncStatusCompleted implements SyncStatus {
  const factory SyncStatusCompleted({final int syncedCount}) =
      _$SyncStatusCompletedImpl;

  int get syncedCount;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStatusCompletedImplCopyWith<_$SyncStatusCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

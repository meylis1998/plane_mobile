// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_conflict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SyncConflict _$SyncConflictFromJson(Map<String, dynamic> json) {
  return _SyncConflict.fromJson(json);
}

/// @nodoc
mixin _$SyncConflict {
  String get id => throw _privateConstructorUsedError;
  String get entityType => throw _privateConstructorUsedError;
  String get entityId => throw _privateConstructorUsedError;
  Map<String, dynamic> get localData => throw _privateConstructorUsedError;
  Map<String, dynamic> get serverData => throw _privateConstructorUsedError;
  DateTime get detectedAt => throw _privateConstructorUsedError;

  /// Serializes this SyncConflict to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncConflict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncConflictCopyWith<SyncConflict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncConflictCopyWith<$Res> {
  factory $SyncConflictCopyWith(
    SyncConflict value,
    $Res Function(SyncConflict) then,
  ) = _$SyncConflictCopyWithImpl<$Res, SyncConflict>;
  @useResult
  $Res call({
    String id,
    String entityType,
    String entityId,
    Map<String, dynamic> localData,
    Map<String, dynamic> serverData,
    DateTime detectedAt,
  });
}

/// @nodoc
class _$SyncConflictCopyWithImpl<$Res, $Val extends SyncConflict>
    implements $SyncConflictCopyWith<$Res> {
  _$SyncConflictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncConflict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? localData = null,
    Object? serverData = null,
    Object? detectedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            entityType: null == entityType
                ? _value.entityType
                : entityType // ignore: cast_nullable_to_non_nullable
                      as String,
            entityId: null == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                      as String,
            localData: null == localData
                ? _value.localData
                : localData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            serverData: null == serverData
                ? _value.serverData
                : serverData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            detectedAt: null == detectedAt
                ? _value.detectedAt
                : detectedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SyncConflictImplCopyWith<$Res>
    implements $SyncConflictCopyWith<$Res> {
  factory _$$SyncConflictImplCopyWith(
    _$SyncConflictImpl value,
    $Res Function(_$SyncConflictImpl) then,
  ) = __$$SyncConflictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String entityType,
    String entityId,
    Map<String, dynamic> localData,
    Map<String, dynamic> serverData,
    DateTime detectedAt,
  });
}

/// @nodoc
class __$$SyncConflictImplCopyWithImpl<$Res>
    extends _$SyncConflictCopyWithImpl<$Res, _$SyncConflictImpl>
    implements _$$SyncConflictImplCopyWith<$Res> {
  __$$SyncConflictImplCopyWithImpl(
    _$SyncConflictImpl _value,
    $Res Function(_$SyncConflictImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncConflict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? localData = null,
    Object? serverData = null,
    Object? detectedAt = null,
  }) {
    return _then(
      _$SyncConflictImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        entityType: null == entityType
            ? _value.entityType
            : entityType // ignore: cast_nullable_to_non_nullable
                  as String,
        entityId: null == entityId
            ? _value.entityId
            : entityId // ignore: cast_nullable_to_non_nullable
                  as String,
        localData: null == localData
            ? _value._localData
            : localData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        serverData: null == serverData
            ? _value._serverData
            : serverData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        detectedAt: null == detectedAt
            ? _value.detectedAt
            : detectedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncConflictImpl implements _SyncConflict {
  const _$SyncConflictImpl({
    required this.id,
    required this.entityType,
    required this.entityId,
    required final Map<String, dynamic> localData,
    required final Map<String, dynamic> serverData,
    required this.detectedAt,
  }) : _localData = localData,
       _serverData = serverData;

  factory _$SyncConflictImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncConflictImplFromJson(json);

  @override
  final String id;
  @override
  final String entityType;
  @override
  final String entityId;
  final Map<String, dynamic> _localData;
  @override
  Map<String, dynamic> get localData {
    if (_localData is EqualUnmodifiableMapView) return _localData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localData);
  }

  final Map<String, dynamic> _serverData;
  @override
  Map<String, dynamic> get serverData {
    if (_serverData is EqualUnmodifiableMapView) return _serverData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_serverData);
  }

  @override
  final DateTime detectedAt;

  @override
  String toString() {
    return 'SyncConflict(id: $id, entityType: $entityType, entityId: $entityId, localData: $localData, serverData: $serverData, detectedAt: $detectedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncConflictImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality().equals(
              other._localData,
              _localData,
            ) &&
            const DeepCollectionEquality().equals(
              other._serverData,
              _serverData,
            ) &&
            (identical(other.detectedAt, detectedAt) ||
                other.detectedAt == detectedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    entityType,
    entityId,
    const DeepCollectionEquality().hash(_localData),
    const DeepCollectionEquality().hash(_serverData),
    detectedAt,
  );

  /// Create a copy of SyncConflict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncConflictImplCopyWith<_$SyncConflictImpl> get copyWith =>
      __$$SyncConflictImplCopyWithImpl<_$SyncConflictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncConflictImplToJson(this);
  }
}

abstract class _SyncConflict implements SyncConflict {
  const factory _SyncConflict({
    required final String id,
    required final String entityType,
    required final String entityId,
    required final Map<String, dynamic> localData,
    required final Map<String, dynamic> serverData,
    required final DateTime detectedAt,
  }) = _$SyncConflictImpl;

  factory _SyncConflict.fromJson(Map<String, dynamic> json) =
      _$SyncConflictImpl.fromJson;

  @override
  String get id;
  @override
  String get entityType;
  @override
  String get entityId;
  @override
  Map<String, dynamic> get localData;
  @override
  Map<String, dynamic> get serverData;
  @override
  DateTime get detectedAt;

  /// Create a copy of SyncConflict
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncConflictImplCopyWith<_$SyncConflictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiResponse _$AiResponseFromJson(Map<String, dynamic> json) {
  return _AiResponse.fromJson(json);
}

/// @nodoc
mixin _$AiResponse {
  String get result => throw _privateConstructorUsedError;
  String get originalText => throw _privateConstructorUsedError;
  AiAction get action => throw _privateConstructorUsedError;

  /// Serializes this AiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiResponseCopyWith<AiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiResponseCopyWith<$Res> {
  factory $AiResponseCopyWith(
    AiResponse value,
    $Res Function(AiResponse) then,
  ) = _$AiResponseCopyWithImpl<$Res, AiResponse>;
  @useResult
  $Res call({String result, String originalText, AiAction action});
}

/// @nodoc
class _$AiResponseCopyWithImpl<$Res, $Val extends AiResponse>
    implements $AiResponseCopyWith<$Res> {
  _$AiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? originalText = null,
    Object? action = null,
  }) {
    return _then(
      _value.copyWith(
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as String,
            originalText: null == originalText
                ? _value.originalText
                : originalText // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as AiAction,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiResponseImplCopyWith<$Res>
    implements $AiResponseCopyWith<$Res> {
  factory _$$AiResponseImplCopyWith(
    _$AiResponseImpl value,
    $Res Function(_$AiResponseImpl) then,
  ) = __$$AiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result, String originalText, AiAction action});
}

/// @nodoc
class __$$AiResponseImplCopyWithImpl<$Res>
    extends _$AiResponseCopyWithImpl<$Res, _$AiResponseImpl>
    implements _$$AiResponseImplCopyWith<$Res> {
  __$$AiResponseImplCopyWithImpl(
    _$AiResponseImpl _value,
    $Res Function(_$AiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? originalText = null,
    Object? action = null,
  }) {
    return _then(
      _$AiResponseImpl(
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String,
        originalText: null == originalText
            ? _value.originalText
            : originalText // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as AiAction,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiResponseImpl implements _AiResponse {
  const _$AiResponseImpl({
    required this.result,
    required this.originalText,
    required this.action,
  });

  factory _$AiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiResponseImplFromJson(json);

  @override
  final String result;
  @override
  final String originalText;
  @override
  final AiAction action;

  @override
  String toString() {
    return 'AiResponse(result: $result, originalText: $originalText, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, originalText, action);

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiResponseImplCopyWith<_$AiResponseImpl> get copyWith =>
      __$$AiResponseImplCopyWithImpl<_$AiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiResponseImplToJson(this);
  }
}

abstract class _AiResponse implements AiResponse {
  const factory _AiResponse({
    required final String result,
    required final String originalText,
    required final AiAction action,
  }) = _$AiResponseImpl;

  factory _AiResponse.fromJson(Map<String, dynamic> json) =
      _$AiResponseImpl.fromJson;

  @override
  String get result;
  @override
  String get originalText;
  @override
  AiAction get action;

  /// Create a copy of AiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiResponseImplCopyWith<_$AiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

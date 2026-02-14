// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiRequest _$AiRequestFromJson(Map<String, dynamic> json) {
  return _AiRequest.fromJson(json);
}

/// @nodoc
mixin _$AiRequest {
  String get text => throw _privateConstructorUsedError;
  AiAction get action => throw _privateConstructorUsedError;
  AiTone? get tone => throw _privateConstructorUsedError;

  /// Serializes this AiRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiRequestCopyWith<AiRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiRequestCopyWith<$Res> {
  factory $AiRequestCopyWith(AiRequest value, $Res Function(AiRequest) then) =
      _$AiRequestCopyWithImpl<$Res, AiRequest>;
  @useResult
  $Res call({String text, AiAction action, AiTone? tone});
}

/// @nodoc
class _$AiRequestCopyWithImpl<$Res, $Val extends AiRequest>
    implements $AiRequestCopyWith<$Res> {
  _$AiRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? action = null,
    Object? tone = freezed,
  }) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as AiAction,
            tone: freezed == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                      as AiTone?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiRequestImplCopyWith<$Res>
    implements $AiRequestCopyWith<$Res> {
  factory _$$AiRequestImplCopyWith(
    _$AiRequestImpl value,
    $Res Function(_$AiRequestImpl) then,
  ) = __$$AiRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, AiAction action, AiTone? tone});
}

/// @nodoc
class __$$AiRequestImplCopyWithImpl<$Res>
    extends _$AiRequestCopyWithImpl<$Res, _$AiRequestImpl>
    implements _$$AiRequestImplCopyWith<$Res> {
  __$$AiRequestImplCopyWithImpl(
    _$AiRequestImpl _value,
    $Res Function(_$AiRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? action = null,
    Object? tone = freezed,
  }) {
    return _then(
      _$AiRequestImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as AiAction,
        tone: freezed == tone
            ? _value.tone
            : tone // ignore: cast_nullable_to_non_nullable
                  as AiTone?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiRequestImpl implements _AiRequest {
  const _$AiRequestImpl({required this.text, required this.action, this.tone});

  factory _$AiRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiRequestImplFromJson(json);

  @override
  final String text;
  @override
  final AiAction action;
  @override
  final AiTone? tone;

  @override
  String toString() {
    return 'AiRequest(text: $text, action: $action, tone: $tone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiRequestImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.tone, tone) || other.tone == tone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, action, tone);

  /// Create a copy of AiRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiRequestImplCopyWith<_$AiRequestImpl> get copyWith =>
      __$$AiRequestImplCopyWithImpl<_$AiRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiRequestImplToJson(this);
  }
}

abstract class _AiRequest implements AiRequest {
  const factory _AiRequest({
    required final String text,
    required final AiAction action,
    final AiTone? tone,
  }) = _$AiRequestImpl;

  factory _AiRequest.fromJson(Map<String, dynamic> json) =
      _$AiRequestImpl.fromJson;

  @override
  String get text;
  @override
  AiAction get action;
  @override
  AiTone? get tone;

  /// Create a copy of AiRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiRequestImplCopyWith<_$AiRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

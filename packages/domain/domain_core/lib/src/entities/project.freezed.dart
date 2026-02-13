// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get workspaceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  ProjectNetwork? get network => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<WorkItemState>? get states => throw _privateConstructorUsedError;
  List<Label>? get labels => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call({
    String id,
    String workspaceId,
    String name,
    String? description,
    String? identifier,
    String? emoji,
    String? coverImage,
    ProjectNetwork? network,
    bool isArchived,
    bool isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WorkItemState>? states,
    List<Label>? labels,
  });
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workspaceId = null,
    Object? name = null,
    Object? description = freezed,
    Object? identifier = freezed,
    Object? emoji = freezed,
    Object? coverImage = freezed,
    Object? network = freezed,
    Object? isArchived = null,
    Object? isFavorite = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? states = freezed,
    Object? labels = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            workspaceId: null == workspaceId
                ? _value.workspaceId
                : workspaceId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            identifier: freezed == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                      as String?,
            emoji: freezed == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImage: freezed == coverImage
                ? _value.coverImage
                : coverImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            network: freezed == network
                ? _value.network
                : network // ignore: cast_nullable_to_non_nullable
                      as ProjectNetwork?,
            isArchived: null == isArchived
                ? _value.isArchived
                : isArchived // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFavorite: null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            states: freezed == states
                ? _value.states
                : states // ignore: cast_nullable_to_non_nullable
                      as List<WorkItemState>?,
            labels: freezed == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<Label>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
    _$ProjectImpl value,
    $Res Function(_$ProjectImpl) then,
  ) = __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String workspaceId,
    String name,
    String? description,
    String? identifier,
    String? emoji,
    String? coverImage,
    ProjectNetwork? network,
    bool isArchived,
    bool isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WorkItemState>? states,
    List<Label>? labels,
  });
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
    _$ProjectImpl _value,
    $Res Function(_$ProjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workspaceId = null,
    Object? name = null,
    Object? description = freezed,
    Object? identifier = freezed,
    Object? emoji = freezed,
    Object? coverImage = freezed,
    Object? network = freezed,
    Object? isArchived = null,
    Object? isFavorite = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? states = freezed,
    Object? labels = freezed,
  }) {
    return _then(
      _$ProjectImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceId: null == workspaceId
            ? _value.workspaceId
            : workspaceId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        identifier: freezed == identifier
            ? _value.identifier
            : identifier // ignore: cast_nullable_to_non_nullable
                  as String?,
        emoji: freezed == emoji
            ? _value.emoji
            : emoji // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImage: freezed == coverImage
            ? _value.coverImage
            : coverImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        network: freezed == network
            ? _value.network
            : network // ignore: cast_nullable_to_non_nullable
                  as ProjectNetwork?,
        isArchived: null == isArchived
            ? _value.isArchived
            : isArchived // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFavorite: null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        states: freezed == states
            ? _value._states
            : states // ignore: cast_nullable_to_non_nullable
                  as List<WorkItemState>?,
        labels: freezed == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<Label>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl({
    required this.id,
    required this.workspaceId,
    required this.name,
    this.description,
    this.identifier,
    this.emoji,
    this.coverImage,
    this.network,
    this.isArchived = false,
    this.isFavorite = false,
    this.createdAt,
    this.updatedAt,
    final List<WorkItemState>? states,
    final List<Label>? labels,
  }) : _states = states,
       _labels = labels;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String workspaceId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? identifier;
  @override
  final String? emoji;
  @override
  final String? coverImage;
  @override
  final ProjectNetwork? network;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<WorkItemState>? _states;
  @override
  List<WorkItemState>? get states {
    final value = _states;
    if (value == null) return null;
    if (_states is EqualUnmodifiableListView) return _states;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Label>? _labels;
  @override
  List<Label>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Project(id: $id, workspaceId: $workspaceId, name: $name, description: $description, identifier: $identifier, emoji: $emoji, coverImage: $coverImage, network: $network, isArchived: $isArchived, isFavorite: $isFavorite, createdAt: $createdAt, updatedAt: $updatedAt, states: $states, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._states, _states) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workspaceId,
    name,
    description,
    identifier,
    emoji,
    coverImage,
    network,
    isArchived,
    isFavorite,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_states),
    const DeepCollectionEquality().hash(_labels),
  );

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(this);
  }
}

abstract class _Project implements Project {
  const factory _Project({
    required final String id,
    required final String workspaceId,
    required final String name,
    final String? description,
    final String? identifier,
    final String? emoji,
    final String? coverImage,
    final ProjectNetwork? network,
    final bool isArchived,
    final bool isFavorite,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final List<WorkItemState>? states,
    final List<Label>? labels,
  }) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get workspaceId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get identifier;
  @override
  String? get emoji;
  @override
  String? get coverImage;
  @override
  ProjectNetwork? get network;
  @override
  bool get isArchived;
  @override
  bool get isFavorite;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<WorkItemState>? get states;
  @override
  List<Label>? get labels;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

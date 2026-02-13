// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Cycle _$CycleFromJson(Map<String, dynamic> json) {
  return _Cycle.fromJson(json);
}

/// @nodoc
mixin _$Cycle {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  CycleStatus? get status => throw _privateConstructorUsedError;
  int? get totalIssues => throw _privateConstructorUsedError;
  int? get completedIssues => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;

  /// Serializes this Cycle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CycleCopyWith<Cycle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) then) =
      _$CycleCopyWithImpl<$Res, Cycle>;
  @useResult
  $Res call({
    String id,
    String projectId,
    String name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    CycleStatus? status,
    int? totalIssues,
    int? completedIssues,
    double? progress,
  });
}

/// @nodoc
class _$CycleCopyWithImpl<$Res, $Val extends Cycle>
    implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
    Object? totalIssues = freezed,
    Object? completedIssues = freezed,
    Object? progress = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CycleStatus?,
            totalIssues: freezed == totalIssues
                ? _value.totalIssues
                : totalIssues // ignore: cast_nullable_to_non_nullable
                      as int?,
            completedIssues: freezed == completedIssues
                ? _value.completedIssues
                : completedIssues // ignore: cast_nullable_to_non_nullable
                      as int?,
            progress: freezed == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CycleImplCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$$CycleImplCopyWith(
    _$CycleImpl value,
    $Res Function(_$CycleImpl) then,
  ) = __$$CycleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String projectId,
    String name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    CycleStatus? status,
    int? totalIssues,
    int? completedIssues,
    double? progress,
  });
}

/// @nodoc
class __$$CycleImplCopyWithImpl<$Res>
    extends _$CycleCopyWithImpl<$Res, _$CycleImpl>
    implements _$$CycleImplCopyWith<$Res> {
  __$$CycleImplCopyWithImpl(
    _$CycleImpl _value,
    $Res Function(_$CycleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
    Object? totalIssues = freezed,
    Object? completedIssues = freezed,
    Object? progress = freezed,
  }) {
    return _then(
      _$CycleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CycleStatus?,
        totalIssues: freezed == totalIssues
            ? _value.totalIssues
            : totalIssues // ignore: cast_nullable_to_non_nullable
                  as int?,
        completedIssues: freezed == completedIssues
            ? _value.completedIssues
            : completedIssues // ignore: cast_nullable_to_non_nullable
                  as int?,
        progress: freezed == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CycleImpl implements _Cycle {
  const _$CycleImpl({
    required this.id,
    required this.projectId,
    required this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.status,
    this.totalIssues,
    this.completedIssues,
    this.progress,
  });

  factory _$CycleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final CycleStatus? status;
  @override
  final int? totalIssues;
  @override
  final int? completedIssues;
  @override
  final double? progress;

  @override
  String toString() {
    return 'Cycle(id: $id, projectId: $projectId, name: $name, description: $description, startDate: $startDate, endDate: $endDate, status: $status, totalIssues: $totalIssues, completedIssues: $completedIssues, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalIssues, totalIssues) ||
                other.totalIssues == totalIssues) &&
            (identical(other.completedIssues, completedIssues) ||
                other.completedIssues == completedIssues) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    projectId,
    name,
    description,
    startDate,
    endDate,
    status,
    totalIssues,
    completedIssues,
    progress,
  );

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleImplCopyWith<_$CycleImpl> get copyWith =>
      __$$CycleImplCopyWithImpl<_$CycleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleImplToJson(this);
  }
}

abstract class _Cycle implements Cycle {
  const factory _Cycle({
    required final String id,
    required final String projectId,
    required final String name,
    final String? description,
    final DateTime? startDate,
    final DateTime? endDate,
    final CycleStatus? status,
    final int? totalIssues,
    final int? completedIssues,
    final double? progress,
  }) = _$CycleImpl;

  factory _Cycle.fromJson(Map<String, dynamic> json) = _$CycleImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  CycleStatus? get status;
  @override
  int? get totalIssues;
  @override
  int? get completedIssues;
  @override
  double? get progress;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CycleImplCopyWith<_$CycleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

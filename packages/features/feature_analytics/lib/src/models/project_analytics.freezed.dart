// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectAnalytics _$ProjectAnalyticsFromJson(Map<String, dynamic> json) {
  return _ProjectAnalytics.fromJson(json);
}

/// @nodoc
mixin _$ProjectAnalytics {
  int get totalIssues => throw _privateConstructorUsedError;
  int get completedIssues => throw _privateConstructorUsedError;
  int get openIssues => throw _privateConstructorUsedError;
  int get overdueIssues => throw _privateConstructorUsedError;
  Map<StateGroup, int> get issuesByState => throw _privateConstructorUsedError;
  Map<Priority, int> get issuesByPriority => throw _privateConstructorUsedError;
  Map<String, int> get issuesByAssignee => throw _privateConstructorUsedError;

  /// Serializes this ProjectAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectAnalyticsCopyWith<ProjectAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectAnalyticsCopyWith<$Res> {
  factory $ProjectAnalyticsCopyWith(
    ProjectAnalytics value,
    $Res Function(ProjectAnalytics) then,
  ) = _$ProjectAnalyticsCopyWithImpl<$Res, ProjectAnalytics>;
  @useResult
  $Res call({
    int totalIssues,
    int completedIssues,
    int openIssues,
    int overdueIssues,
    Map<StateGroup, int> issuesByState,
    Map<Priority, int> issuesByPriority,
    Map<String, int> issuesByAssignee,
  });
}

/// @nodoc
class _$ProjectAnalyticsCopyWithImpl<$Res, $Val extends ProjectAnalytics>
    implements $ProjectAnalyticsCopyWith<$Res> {
  _$ProjectAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIssues = null,
    Object? completedIssues = null,
    Object? openIssues = null,
    Object? overdueIssues = null,
    Object? issuesByState = null,
    Object? issuesByPriority = null,
    Object? issuesByAssignee = null,
  }) {
    return _then(
      _value.copyWith(
            totalIssues: null == totalIssues
                ? _value.totalIssues
                : totalIssues // ignore: cast_nullable_to_non_nullable
                      as int,
            completedIssues: null == completedIssues
                ? _value.completedIssues
                : completedIssues // ignore: cast_nullable_to_non_nullable
                      as int,
            openIssues: null == openIssues
                ? _value.openIssues
                : openIssues // ignore: cast_nullable_to_non_nullable
                      as int,
            overdueIssues: null == overdueIssues
                ? _value.overdueIssues
                : overdueIssues // ignore: cast_nullable_to_non_nullable
                      as int,
            issuesByState: null == issuesByState
                ? _value.issuesByState
                : issuesByState // ignore: cast_nullable_to_non_nullable
                      as Map<StateGroup, int>,
            issuesByPriority: null == issuesByPriority
                ? _value.issuesByPriority
                : issuesByPriority // ignore: cast_nullable_to_non_nullable
                      as Map<Priority, int>,
            issuesByAssignee: null == issuesByAssignee
                ? _value.issuesByAssignee
                : issuesByAssignee // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectAnalyticsImplCopyWith<$Res>
    implements $ProjectAnalyticsCopyWith<$Res> {
  factory _$$ProjectAnalyticsImplCopyWith(
    _$ProjectAnalyticsImpl value,
    $Res Function(_$ProjectAnalyticsImpl) then,
  ) = __$$ProjectAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalIssues,
    int completedIssues,
    int openIssues,
    int overdueIssues,
    Map<StateGroup, int> issuesByState,
    Map<Priority, int> issuesByPriority,
    Map<String, int> issuesByAssignee,
  });
}

/// @nodoc
class __$$ProjectAnalyticsImplCopyWithImpl<$Res>
    extends _$ProjectAnalyticsCopyWithImpl<$Res, _$ProjectAnalyticsImpl>
    implements _$$ProjectAnalyticsImplCopyWith<$Res> {
  __$$ProjectAnalyticsImplCopyWithImpl(
    _$ProjectAnalyticsImpl _value,
    $Res Function(_$ProjectAnalyticsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIssues = null,
    Object? completedIssues = null,
    Object? openIssues = null,
    Object? overdueIssues = null,
    Object? issuesByState = null,
    Object? issuesByPriority = null,
    Object? issuesByAssignee = null,
  }) {
    return _then(
      _$ProjectAnalyticsImpl(
        totalIssues: null == totalIssues
            ? _value.totalIssues
            : totalIssues // ignore: cast_nullable_to_non_nullable
                  as int,
        completedIssues: null == completedIssues
            ? _value.completedIssues
            : completedIssues // ignore: cast_nullable_to_non_nullable
                  as int,
        openIssues: null == openIssues
            ? _value.openIssues
            : openIssues // ignore: cast_nullable_to_non_nullable
                  as int,
        overdueIssues: null == overdueIssues
            ? _value.overdueIssues
            : overdueIssues // ignore: cast_nullable_to_non_nullable
                  as int,
        issuesByState: null == issuesByState
            ? _value._issuesByState
            : issuesByState // ignore: cast_nullable_to_non_nullable
                  as Map<StateGroup, int>,
        issuesByPriority: null == issuesByPriority
            ? _value._issuesByPriority
            : issuesByPriority // ignore: cast_nullable_to_non_nullable
                  as Map<Priority, int>,
        issuesByAssignee: null == issuesByAssignee
            ? _value._issuesByAssignee
            : issuesByAssignee // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectAnalyticsImpl implements _ProjectAnalytics {
  const _$ProjectAnalyticsImpl({
    required this.totalIssues,
    required this.completedIssues,
    required this.openIssues,
    required this.overdueIssues,
    required final Map<StateGroup, int> issuesByState,
    required final Map<Priority, int> issuesByPriority,
    required final Map<String, int> issuesByAssignee,
  }) : _issuesByState = issuesByState,
       _issuesByPriority = issuesByPriority,
       _issuesByAssignee = issuesByAssignee;

  factory _$ProjectAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectAnalyticsImplFromJson(json);

  @override
  final int totalIssues;
  @override
  final int completedIssues;
  @override
  final int openIssues;
  @override
  final int overdueIssues;
  final Map<StateGroup, int> _issuesByState;
  @override
  Map<StateGroup, int> get issuesByState {
    if (_issuesByState is EqualUnmodifiableMapView) return _issuesByState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_issuesByState);
  }

  final Map<Priority, int> _issuesByPriority;
  @override
  Map<Priority, int> get issuesByPriority {
    if (_issuesByPriority is EqualUnmodifiableMapView) return _issuesByPriority;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_issuesByPriority);
  }

  final Map<String, int> _issuesByAssignee;
  @override
  Map<String, int> get issuesByAssignee {
    if (_issuesByAssignee is EqualUnmodifiableMapView) return _issuesByAssignee;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_issuesByAssignee);
  }

  @override
  String toString() {
    return 'ProjectAnalytics(totalIssues: $totalIssues, completedIssues: $completedIssues, openIssues: $openIssues, overdueIssues: $overdueIssues, issuesByState: $issuesByState, issuesByPriority: $issuesByPriority, issuesByAssignee: $issuesByAssignee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectAnalyticsImpl &&
            (identical(other.totalIssues, totalIssues) ||
                other.totalIssues == totalIssues) &&
            (identical(other.completedIssues, completedIssues) ||
                other.completedIssues == completedIssues) &&
            (identical(other.openIssues, openIssues) ||
                other.openIssues == openIssues) &&
            (identical(other.overdueIssues, overdueIssues) ||
                other.overdueIssues == overdueIssues) &&
            const DeepCollectionEquality().equals(
              other._issuesByState,
              _issuesByState,
            ) &&
            const DeepCollectionEquality().equals(
              other._issuesByPriority,
              _issuesByPriority,
            ) &&
            const DeepCollectionEquality().equals(
              other._issuesByAssignee,
              _issuesByAssignee,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalIssues,
    completedIssues,
    openIssues,
    overdueIssues,
    const DeepCollectionEquality().hash(_issuesByState),
    const DeepCollectionEquality().hash(_issuesByPriority),
    const DeepCollectionEquality().hash(_issuesByAssignee),
  );

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectAnalyticsImplCopyWith<_$ProjectAnalyticsImpl> get copyWith =>
      __$$ProjectAnalyticsImplCopyWithImpl<_$ProjectAnalyticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectAnalyticsImplToJson(this);
  }
}

abstract class _ProjectAnalytics implements ProjectAnalytics {
  const factory _ProjectAnalytics({
    required final int totalIssues,
    required final int completedIssues,
    required final int openIssues,
    required final int overdueIssues,
    required final Map<StateGroup, int> issuesByState,
    required final Map<Priority, int> issuesByPriority,
    required final Map<String, int> issuesByAssignee,
  }) = _$ProjectAnalyticsImpl;

  factory _ProjectAnalytics.fromJson(Map<String, dynamic> json) =
      _$ProjectAnalyticsImpl.fromJson;

  @override
  int get totalIssues;
  @override
  int get completedIssues;
  @override
  int get openIssues;
  @override
  int get overdueIssues;
  @override
  Map<StateGroup, int> get issuesByState;
  @override
  Map<Priority, int> get issuesByPriority;
  @override
  Map<String, int> get issuesByAssignee;

  /// Create a copy of ProjectAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectAnalyticsImplCopyWith<_$ProjectAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

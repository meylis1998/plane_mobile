// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PageTreeNode {
  Page get page => throw _privateConstructorUsedError;
  List<PageTreeNode> get children => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Create a copy of PageTreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageTreeNodeCopyWith<PageTreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageTreeNodeCopyWith<$Res> {
  factory $PageTreeNodeCopyWith(
    PageTreeNode value,
    $Res Function(PageTreeNode) then,
  ) = _$PageTreeNodeCopyWithImpl<$Res, PageTreeNode>;
  @useResult
  $Res call({
    Page page,
    List<PageTreeNode> children,
    int depth,
    bool isExpanded,
  });

  $PageCopyWith<$Res> get page;
}

/// @nodoc
class _$PageTreeNodeCopyWithImpl<$Res, $Val extends PageTreeNode>
    implements $PageTreeNodeCopyWith<$Res> {
  _$PageTreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageTreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? children = null,
    Object? depth = null,
    Object? isExpanded = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as Page,
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<PageTreeNode>,
            depth: null == depth
                ? _value.depth
                : depth // ignore: cast_nullable_to_non_nullable
                      as int,
            isExpanded: null == isExpanded
                ? _value.isExpanded
                : isExpanded // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of PageTreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res> get page {
    return $PageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageTreeNodeImplCopyWith<$Res>
    implements $PageTreeNodeCopyWith<$Res> {
  factory _$$PageTreeNodeImplCopyWith(
    _$PageTreeNodeImpl value,
    $Res Function(_$PageTreeNodeImpl) then,
  ) = __$$PageTreeNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Page page,
    List<PageTreeNode> children,
    int depth,
    bool isExpanded,
  });

  @override
  $PageCopyWith<$Res> get page;
}

/// @nodoc
class __$$PageTreeNodeImplCopyWithImpl<$Res>
    extends _$PageTreeNodeCopyWithImpl<$Res, _$PageTreeNodeImpl>
    implements _$$PageTreeNodeImplCopyWith<$Res> {
  __$$PageTreeNodeImplCopyWithImpl(
    _$PageTreeNodeImpl _value,
    $Res Function(_$PageTreeNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PageTreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? children = null,
    Object? depth = null,
    Object? isExpanded = null,
  }) {
    return _then(
      _$PageTreeNodeImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as Page,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<PageTreeNode>,
        depth: null == depth
            ? _value.depth
            : depth // ignore: cast_nullable_to_non_nullable
                  as int,
        isExpanded: null == isExpanded
            ? _value.isExpanded
            : isExpanded // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$PageTreeNodeImpl implements _PageTreeNode {
  const _$PageTreeNodeImpl({
    required this.page,
    final List<PageTreeNode> children = const [],
    this.depth = 0,
    this.isExpanded = false,
  }) : _children = children;

  @override
  final Page page;
  final List<PageTreeNode> _children;
  @override
  @JsonKey()
  List<PageTreeNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  @JsonKey()
  final int depth;
  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'PageTreeNode(page: $page, children: $children, depth: $depth, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageTreeNodeImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    const DeepCollectionEquality().hash(_children),
    depth,
    isExpanded,
  );

  /// Create a copy of PageTreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageTreeNodeImplCopyWith<_$PageTreeNodeImpl> get copyWith =>
      __$$PageTreeNodeImplCopyWithImpl<_$PageTreeNodeImpl>(this, _$identity);
}

abstract class _PageTreeNode implements PageTreeNode {
  const factory _PageTreeNode({
    required final Page page,
    final List<PageTreeNode> children,
    final int depth,
    final bool isExpanded,
  }) = _$PageTreeNodeImpl;

  @override
  Page get page;
  @override
  List<PageTreeNode> get children;
  @override
  int get depth;
  @override
  bool get isExpanded;

  /// Create a copy of PageTreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageTreeNodeImplCopyWith<_$PageTreeNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

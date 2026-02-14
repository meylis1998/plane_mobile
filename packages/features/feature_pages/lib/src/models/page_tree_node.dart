import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_tree_node.freezed.dart';

@freezed
class PageTreeNode with _$PageTreeNode {
  const factory PageTreeNode({
    required Page page,
    @Default([]) List<PageTreeNode> children,
    @Default(0) int depth,
    @Default(false) bool isExpanded,
  }) = _PageTreeNode;
}

import 'package:domain_core/src/entities/work_item_state.dart';
import 'package:domain_core/src/enums/priority.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item.freezed.dart';
part 'work_item.g.dart';

@freezed
class WorkItem with _$WorkItem {
  const factory WorkItem({
    required String id,
    required String projectId,
    required String workspaceSlug,
    required String name,
    required WorkItemState state,
    required Priority priority,
    String? description,
    String? descriptionHtml,
    DateTime? startDate,
    DateTime? targetDate,
    String? parentId,
    int? sequenceId,
    @Default(0) int sortOrder,
    List<String>? assigneeIds,
    List<String>? labelIds,
    String? cycleId,
    String? moduleId,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? estimate,
    @Default(false) bool isDirty,
    @Default(0) int localVersion,
    int? serverVersion,
  }) = _WorkItem;

  factory WorkItem.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFromJson(json);
}

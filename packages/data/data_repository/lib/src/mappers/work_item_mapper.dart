import 'dart:convert';

import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:drift/drift.dart';

/// Maps between [WorkItem] domain entity and [WorkItemsTableData] row.
class WorkItemMapper {
  const WorkItemMapper._();

  static WorkItem fromRow(WorkItemsTableData row, {WorkItemState? state}) {
    return WorkItem(
      id: row.id,
      projectId: row.projectId,
      workspaceSlug: row.workspaceSlug,
      name: row.name,
      description: row.description,
      descriptionHtml: row.descriptionHtml,
      state: state ??
          WorkItemState(
            id: row.stateId ?? '',
            name: '',
            group: StateGroup.backlog,
            color: '#888888',
            sequence: 0,
            projectId: row.projectId,
          ),
      priority: _priorityFromInt(row.priority),
      startDate: row.startDate,
      targetDate: row.targetDate,
      parentId: row.parentId,
      sequenceId: row.sequenceId,
      sortOrder: row.sortOrder,
      assigneeIds: _decodeStringList(row.assigneeIds),
      labelIds: _decodeStringList(row.labelIds),
      cycleId: row.cycleId,
      moduleId: row.moduleId,
      createdById: row.createdById,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      estimate: row.estimate,
      isDirty: row.isDirty,
      localVersion: row.localVersion,
      serverVersion: row.serverVersion,
    );
  }

  static WorkItemsTableCompanion toCompanion(WorkItem entity) {
    return WorkItemsTableCompanion(
      id: Value(entity.id),
      projectId: Value(entity.projectId),
      workspaceSlug: Value(entity.workspaceSlug),
      name: Value(entity.name),
      description: Value.absentIfNull(entity.description),
      descriptionHtml: Value.absentIfNull(entity.descriptionHtml),
      stateId: Value(entity.state.id),
      priority: Value(_priorityToInt(entity.priority)),
      startDate: Value.absentIfNull(entity.startDate),
      targetDate: Value.absentIfNull(entity.targetDate),
      parentId: Value.absentIfNull(entity.parentId),
      sequenceId: Value.absentIfNull(entity.sequenceId),
      sortOrder: Value(entity.sortOrder),
      assigneeIds: Value(jsonEncode(entity.assigneeIds ?? [])),
      labelIds: Value(jsonEncode(entity.labelIds ?? [])),
      cycleId: Value.absentIfNull(entity.cycleId),
      moduleId: Value.absentIfNull(entity.moduleId),
      createdById: Value.absentIfNull(entity.createdById),
      createdAt: Value.absentIfNull(entity.createdAt),
      updatedAt: Value.absentIfNull(entity.updatedAt),
      estimate: Value.absentIfNull(entity.estimate),
      isDirty: Value(entity.isDirty),
      localVersion: Value(entity.localVersion),
      serverVersion: Value.absentIfNull(entity.serverVersion),
    );
  }

  static WorkItem fromJson(Map<String, dynamic> json) {
    return WorkItem(
      id: json['id'] as String,
      projectId: (json['project'] ?? json['project_id'] ?? '') as String,
      workspaceSlug: (json['workspace_slug'] ?? '') as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      descriptionHtml: json['description_html'] as String?,
      state: _parseState(json),
      priority: _priorityFromString(json['priority'] as String? ?? 'none'),
      startDate: _parseDateTime(json['start_date']),
      targetDate: _parseDateTime(json['target_date']),
      parentId: json['parent'] as String?,
      sequenceId: json['sequence_id'] as int?,
      sortOrder: json['sort_order'] as int? ?? 0,
      assigneeIds: _parseStringList(json['assignees'] ?? json['assignee_ids']),
      labelIds: _parseStringList(json['labels'] ?? json['label_ids']),
      cycleId: json['cycle'] as String?,
      moduleId: json['module'] as String?,
      createdById: json['created_by'] as String?,
      createdAt: _parseDateTime(json['created_at']),
      updatedAt: _parseDateTime(json['updated_at']),
      estimate: json['estimate_point'] as int?,
    );
  }

  static WorkItemState _parseState(Map<String, dynamic> json) {
    final state = json['state_detail'] ?? json['state'];
    if (state is Map<String, dynamic>) {
      return WorkItemState(
        id: state['id'] as String,
        name: state['name'] as String? ?? '',
        group: _stateGroupFromString(state['group'] as String? ?? 'backlog'),
        color: state['color'] as String? ?? '#888888',
        sequence: state['sequence'] as int? ?? 0,
        projectId: (state['project'] ?? json['project'] ?? '') as String,
      );
    }
    final stateId = (state ?? '') as String;
    return WorkItemState(
      id: stateId,
      name: '',
      group: StateGroup.backlog,
      color: '#888888',
      sequence: 0,
      projectId: (json['project'] ?? '') as String,
    );
  }

  static StateGroup _stateGroupFromString(String value) {
    return StateGroup.values.firstWhere(
      (g) => g.name == value,
      orElse: () => StateGroup.backlog,
    );
  }

  static Priority _priorityFromString(String value) {
    return Priority.values.firstWhere(
      (p) => p.name == value,
      orElse: () => Priority.none,
    );
  }

  static Priority _priorityFromInt(int value) {
    const mapping = {
      0: Priority.urgent,
      1: Priority.high,
      2: Priority.medium,
      3: Priority.low,
      4: Priority.none,
    };
    return mapping[value] ?? Priority.none;
  }

  static int _priorityToInt(Priority priority) {
    return switch (priority) {
      Priority.urgent => 0,
      Priority.high => 1,
      Priority.medium => 2,
      Priority.low => 3,
      Priority.none => 4,
    };
  }

  static List<String>? _parseStringList(dynamic value) {
    if (value == null) return null;
    if (value is List) return value.cast<String>();
    return null;
  }

  static List<String>? _decodeStringList(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) return decoded.cast<String>();
    } catch (_) {}
    return null;
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}

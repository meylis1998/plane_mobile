import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:drift/drift.dart';

/// Maps between [Module] domain entity and [ModulesTableData] row.
class ModuleMapper {
  const ModuleMapper._();

  static Module fromRow(ModulesTableData row) {
    return Module(
      id: row.id,
      projectId: row.projectId,
      name: row.name,
      description: row.description,
      status: row.status.toString(),
      startDate: row.startDate,
      targetDate: row.targetDate,
    );
  }

  static ModulesTableCompanion toCompanion(Module entity) {
    return ModulesTableCompanion(
      id: Value(entity.id),
      projectId: Value(entity.projectId),
      name: Value(entity.name),
      description: Value.absentIfNull(entity.description),
      status: Value(int.tryParse(entity.status ?? '0') ?? 0),
      startDate: Value.absentIfNull(entity.startDate),
      targetDate: Value.absentIfNull(entity.targetDate),
    );
  }

  static Module fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'] as String,
      projectId: (json['project'] ?? json['project_id'] ?? '') as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      status: json['status'] as String?,
      startDate: _parseDateTime(json['start_date']),
      targetDate: _parseDateTime(json['target_date']),
      totalIssues: json['total_issues'] as int?,
      completedIssues: json['completed_issues'] as int?,
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}

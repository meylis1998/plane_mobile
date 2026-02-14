import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:drift/drift.dart';

/// Maps between [Cycle] domain entity and [CyclesTableData] row.
class CycleMapper {
  const CycleMapper._();

  static Cycle fromRow(CyclesTableData row) {
    return Cycle(
      id: row.id,
      projectId: row.projectId,
      name: row.name,
      description: row.description,
      startDate: row.startDate,
      endDate: row.endDate,
      status: _statusFromInt(row.status),
      totalIssues: row.totalIssues,
      completedIssues: row.completedIssues,
      progress: row.progress,
    );
  }

  static CyclesTableCompanion toCompanion(Cycle entity) {
    return CyclesTableCompanion(
      id: Value(entity.id),
      projectId: Value(entity.projectId),
      name: Value(entity.name),
      description: Value.absentIfNull(entity.description),
      startDate: Value.absentIfNull(entity.startDate),
      endDate: Value.absentIfNull(entity.endDate),
      status: Value(entity.status?.index ?? 0),
      totalIssues: Value.absentIfNull(entity.totalIssues),
      completedIssues: Value.absentIfNull(entity.completedIssues),
      progress: Value.absentIfNull(entity.progress),
    );
  }

  static Cycle fromJson(Map<String, dynamic> json) {
    return Cycle(
      id: json['id'] as String,
      projectId: (json['project'] ?? json['project_id'] ?? '') as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      startDate: _parseDateTime(json['start_date']),
      endDate: _parseDateTime(json['end_date']),
      status: _statusFromString(json['status'] as String?),
      totalIssues: json['total_issues'] as int?,
      completedIssues: json['completed_issues'] as int?,
      progress: (json['progress'] as num?)?.toDouble(),
    );
  }

  static CycleStatus? _statusFromInt(int value) {
    if (value < 0 || value >= CycleStatus.values.length) return null;
    return CycleStatus.values[value];
  }

  static CycleStatus? _statusFromString(String? value) {
    if (value == null) return null;
    return CycleStatus.values.firstWhere(
      (s) => s.name == value,
      orElse: () => CycleStatus.draft,
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}

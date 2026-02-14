import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:drift/drift.dart';

/// Maps between [Project] domain entity and [ProjectsTableData] row.
class ProjectMapper {
  const ProjectMapper._();

  static Project fromRow(ProjectsTableData row) {
    return Project(
      id: row.id,
      workspaceId: row.workspaceId,
      name: row.name,
      description: row.description,
      identifier: row.identifier,
      emoji: row.emoji,
      coverImage: row.coverImage,
      network: _networkFromInt(row.network),
      isArchived: row.isArchived,
      isFavorite: row.isFavorite,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  static ProjectsTableCompanion toCompanion(Project entity) {
    return ProjectsTableCompanion(
      id: Value(entity.id),
      workspaceId: Value(entity.workspaceId),
      name: Value(entity.name),
      description: Value.absentIfNull(entity.description),
      identifier: Value.absentIfNull(entity.identifier),
      emoji: Value.absentIfNull(entity.emoji),
      coverImage: Value.absentIfNull(entity.coverImage),
      network: Value(entity.network?.value ?? 0),
      isArchived: Value(entity.isArchived),
      isFavorite: Value(entity.isFavorite),
      createdAt: Value.absentIfNull(entity.createdAt),
      updatedAt: Value.absentIfNull(entity.updatedAt),
    );
  }

  static Project fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      workspaceId: (json['workspace'] ?? json['workspace_id'] ?? '') as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      identifier: json['identifier'] as String?,
      emoji: json['emoji'] as String?,
      coverImage: json['cover_image'] as String?,
      network: _networkFromInt(json['network'] as int? ?? 0),
      isArchived: json['is_archived'] as bool? ?? false,
      isFavorite: json['is_favorite'] as bool? ?? false,
      createdAt: _parseDateTime(json['created_at']),
      updatedAt: _parseDateTime(json['updated_at']),
    );
  }

  static ProjectNetwork? _networkFromInt(int value) {
    for (final n in ProjectNetwork.values) {
      if (n.value == value) return n;
    }
    return null;
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}

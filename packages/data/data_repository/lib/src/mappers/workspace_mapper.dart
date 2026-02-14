import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:drift/drift.dart';

/// Maps between [Workspace] domain entity and [WorkspacesTableData] row.
class WorkspaceMapper {
  const WorkspaceMapper._();

  static Workspace fromRow(WorkspacesTableData row) {
    return Workspace(
      id: row.id,
      name: row.name,
      slug: row.slug,
      logo: row.logo,
    );
  }

  static WorkspacesTableCompanion toCompanion(Workspace entity) {
    return WorkspacesTableCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      slug: Value(entity.slug),
      logo: Value.absentIfNull(entity.logo),
    );
  }

  static Workspace fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      logo: json['logo'] as String?,
      memberCount: json['total_members'] as int?,
    );
  }
}

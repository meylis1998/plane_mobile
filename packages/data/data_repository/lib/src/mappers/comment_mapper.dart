import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:drift/drift.dart';

/// Maps between [Comment] domain entity and [CommentsTableData] row.
class CommentMapper {
  const CommentMapper._();

  static Comment fromRow(CommentsTableData row) {
    return Comment(
      id: row.id,
      workItemId: row.workItemId,
      body: row.body,
      createdById: row.createdById ?? '',
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  static CommentsTableCompanion toCompanion(Comment entity) {
    return CommentsTableCompanion(
      id: Value(entity.id),
      workItemId: Value(entity.workItemId),
      body: Value(entity.body),
      createdById: Value(entity.createdById),
      createdAt: Value.absentIfNull(entity.createdAt),
      updatedAt: Value.absentIfNull(entity.updatedAt),
    );
  }

  static Comment fromJson(Map<String, dynamic> json) {
    final issueDetail = json['issue_detail'];
    final issueDetailId =
        issueDetail is Map<String, dynamic> ? issueDetail['id'] : null;
    return Comment(
      id: json['id'] as String,
      workItemId: (json['issue'] ??
              json['work_item'] ??
              issueDetailId ??
              '') as String,
      body: (json['comment_stripped'] ??
              json['comment_html'] ??
              json['body'] ??
              '') as String,
      createdById:
          (json['actor'] ?? json['created_by'] ?? '') as String,
      createdAt: _parseDateTime(json['created_at']),
      updatedAt: _parseDateTime(json['updated_at']),
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}

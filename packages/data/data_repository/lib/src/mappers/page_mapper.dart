import 'package:domain_core/domain_core.dart';

/// Maps JSON to [Page] domain entity.
///
/// Pages are not cached locally in this iteration, so there is no
/// Drift companion mapper.
class PageMapper {
  const PageMapper._();

  static Page fromJson(Map<String, dynamic> json) {
    return Page(
      id: json['id'] as String,
      projectId: (json['project'] ?? json['project_id'] ?? '') as String,
      name: json['name'] as String,
      access: _accessFromString(json['access'] as String?),
      content: json['content_html'] as String?,
      isFavorite: json['is_favorite'] as bool? ?? false,
      createdAt: _parseDateTime(json['created_at']),
      updatedAt: _parseDateTime(json['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Page entity) {
    return {
      'name': entity.name,
      if (entity.access != null)
        'access': entity.access!.name.replaceAll('_', ''),
      if (entity.content != null) 'content_html': entity.content,
    };
  }

  static PageAccess? _accessFromString(String? value) {
    if (value == null) return null;
    return PageAccess.values.firstWhere(
      (a) => a.name.replaceAll('_', '') == value,
      orElse: () => PageAccess.public_,
    );
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}

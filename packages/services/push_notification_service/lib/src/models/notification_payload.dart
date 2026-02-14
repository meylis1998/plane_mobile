/// A parsed push notification payload from the Plane backend.
///
/// The backend sends a data payload with an entity type and identifiers
/// so the app can navigate to the correct screen on tap.
class NotificationPayload {
  const NotificationPayload({
    required this.entityType,
    this.entityId,
    this.projectId,
    this.workspaceSlug,
    this.title,
    this.body,
  });

  /// Parses a raw FCM data map into a [NotificationPayload].
  ///
  /// Expected keys: `entity_type`, `entity_id`, `project_id`,
  /// `workspace_slug`, `title`, `body`.
  factory NotificationPayload.fromData(Map<String, dynamic> data) {
    return NotificationPayload(
      entityType: data['entity_type'] as String? ?? '',
      entityId: data['entity_id'] as String?,
      projectId: data['project_id'] as String?,
      workspaceSlug: data['workspace_slug'] as String?,
      title: data['title'] as String?,
      body: data['body'] as String?,
    );
  }

  /// The type of entity this notification refers to.
  ///
  /// Known values: `work_item`, `comment`, `cycle`, `module`,
  /// `project`, `notification`.
  final String entityType;

  /// The unique ID of the entity.
  final String? entityId;

  /// The project ID the entity belongs to (when applicable).
  final String? projectId;

  /// The workspace slug for constructing navigation paths.
  final String? workspaceSlug;

  /// Notification display title.
  final String? title;

  /// Notification display body text.
  final String? body;
}

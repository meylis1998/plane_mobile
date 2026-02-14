import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:push_notification_service/push_notification_service.dart';

void main() {
  late NotificationRouter router;

  setUp(() {
    router = const NotificationRouter();
  });

  group('NotificationRouter', () {
    test('routes work_item to issue detail', () {
      final route = router.routeNotification({
        'entity_type': 'work_item',
        'entity_id': 'issue-123',
        'project_id': 'project-456',
      });

      expect(route, '/home/projects/project-456/issues/issue-123');
    });

    test('routes comment to issue detail', () {
      final route = router.routeNotification({
        'entity_type': 'comment',
        'entity_id': 'issue-789',
        'project_id': 'project-456',
      });

      expect(route, '/home/projects/project-456/issues/issue-789');
    });

    test('routes cycle to cycle detail', () {
      final route = router.routeNotification({
        'entity_type': 'cycle',
        'entity_id': 'cycle-101',
        'project_id': 'project-456',
      });

      expect(route, '/home/projects/project-456/cycles/cycle-101');
    });

    test('routes module to module detail', () {
      final route = router.routeNotification({
        'entity_type': 'module',
        'entity_id': 'module-202',
        'project_id': 'project-456',
      });

      expect(route, '/home/projects/project-456/modules/module-202');
    });

    test('routes project to project detail', () {
      final route = router.routeNotification({
        'entity_type': 'project',
        'entity_id': 'project-456',
      });

      expect(route, '/home/projects/project-456');
    });

    test('routes notification type to notifications screen', () {
      final route = router.routeNotification({
        'entity_type': 'notification',
      });

      expect(route, '/home/notifications');
    });

    test('returns null for unknown entity type', () {
      final route = router.routeNotification({
        'entity_type': 'unknown',
      });

      expect(route, isNull);
    });

    test('returns null when required fields are missing', () {
      final route = router.routeNotification({
        'entity_type': 'work_item',
        // Missing project_id and entity_id
      });

      expect(route, isNull);
    });

    test('routeFromPayloadString decodes JSON and routes', () {
      final payload = jsonEncode({
        'entity_type': 'work_item',
        'entity_id': 'issue-123',
        'project_id': 'project-456',
      });

      final route = router.routeFromPayloadString(payload);
      expect(route, '/home/projects/project-456/issues/issue-123');
    });

    test('routeFromPayloadString returns null for null input', () {
      expect(router.routeFromPayloadString(null), isNull);
    });

    test('routeFromPayloadString returns null for empty string', () {
      expect(router.routeFromPayloadString(''), isNull);
    });

    test('routeFromPayloadString returns null for invalid JSON', () {
      expect(router.routeFromPayloadString('not-json'), isNull);
    });
  });

  group('NotificationPayload', () {
    test('parses data map correctly', () {
      final payload = NotificationPayload.fromData({
        'entity_type': 'work_item',
        'entity_id': 'issue-1',
        'project_id': 'proj-1',
        'workspace_slug': 'my-workspace',
        'title': 'New Issue',
        'body': 'You were assigned',
      });

      expect(payload.entityType, 'work_item');
      expect(payload.entityId, 'issue-1');
      expect(payload.projectId, 'proj-1');
      expect(payload.workspaceSlug, 'my-workspace');
      expect(payload.title, 'New Issue');
      expect(payload.body, 'You were assigned');
    });

    test('handles missing fields gracefully', () {
      final payload = NotificationPayload.fromData(<String, dynamic>{});

      expect(payload.entityType, '');
      expect(payload.entityId, isNull);
      expect(payload.projectId, isNull);
      expect(payload.workspaceSlug, isNull);
      expect(payload.title, isNull);
      expect(payload.body, isNull);
    });
  });
}

import 'package:data_repository/src/mappers/work_item_mapper.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkItemMapper.fromJson', () {
    test('parses minimal JSON', () {
      final json = <String, dynamic>{
        'id': 'wi-1',
        'project': 'proj-1',
        'workspace_slug': 'ws-1',
        'name': 'Test Item',
        'priority': 'medium',
        'state': 'state-1',
      };

      final item = WorkItemMapper.fromJson(json);
      expect(item.id, 'wi-1');
      expect(item.projectId, 'proj-1');
      expect(item.workspaceSlug, 'ws-1');
      expect(item.name, 'Test Item');
      expect(item.priority, Priority.medium);
      expect(item.state.id, 'state-1');
    });

    test('parses with state_detail object', () {
      final json = <String, dynamic>{
        'id': 'wi-1',
        'project': 'proj-1',
        'workspace_slug': 'ws-1',
        'name': 'Test Item',
        'priority': 'high',
        'state_detail': {
          'id': 'state-1',
          'name': 'In Progress',
          'group': 'started',
          'color': '#FF0000',
          'sequence': 5,
          'project': 'proj-1',
        },
      };

      final item = WorkItemMapper.fromJson(json);
      expect(item.state.id, 'state-1');
      expect(item.state.name, 'In Progress');
      expect(item.state.group, StateGroup.started);
      expect(item.state.color, '#FF0000');
      expect(item.state.sequence, 5);
    });

    test('parses assignees and labels', () {
      final json = <String, dynamic>{
        'id': 'wi-1',
        'project': 'proj-1',
        'workspace_slug': 'ws-1',
        'name': 'Test',
        'priority': 'none',
        'state': 'state-1',
        'assignees': ['user-1', 'user-2'],
        'labels': ['label-1'],
      };

      final item = WorkItemMapper.fromJson(json);
      expect(item.assigneeIds, ['user-1', 'user-2']);
      expect(item.labelIds, ['label-1']);
    });

    test('parses dates', () {
      final json = <String, dynamic>{
        'id': 'wi-1',
        'project': 'proj-1',
        'workspace_slug': 'ws-1',
        'name': 'Test',
        'priority': 'low',
        'state': 'state-1',
        'start_date': '2024-01-01',
        'target_date': '2024-02-01',
        'created_at': '2024-01-01T10:00:00.000Z',
      };

      final item = WorkItemMapper.fromJson(json);
      expect(item.startDate, isNotNull);
      expect(item.targetDate, isNotNull);
      expect(item.createdAt, isNotNull);
    });

    test('handles unknown priority gracefully', () {
      final json = <String, dynamic>{
        'id': 'wi-1',
        'project': 'proj-1',
        'workspace_slug': 'ws-1',
        'name': 'Test',
        'priority': 'unknown_priority',
        'state': 'state-1',
      };

      final item = WorkItemMapper.fromJson(json);
      expect(item.priority, Priority.none);
    });
  });

  group('WorkItemMapper.toCompanion', () {
    test('converts entity to companion', () {
      final item = WorkItem(
        id: 'wi-1',
        projectId: 'proj-1',
        workspaceSlug: 'ws-1',
        name: 'Test',
        state: const WorkItemState(
          id: 'state-1',
          name: 'Todo',
          group: StateGroup.backlog,
          color: '#888888',
          sequence: 0,
          projectId: 'proj-1',
        ),
        priority: Priority.high,
        assigneeIds: ['user-1'],
        labelIds: ['label-1'],
      );

      final companion = WorkItemMapper.toCompanion(item);
      expect(companion.id.value, 'wi-1');
      expect(companion.projectId.value, 'proj-1');
      expect(companion.name.value, 'Test');
    });
  });
}

import 'package:data_repository/src/mappers/cycle_mapper.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CycleMapper.fromJson', () {
    test('parses minimal JSON', () {
      final json = <String, dynamic>{
        'id': 'c-1',
        'project': 'proj-1',
        'name': 'Sprint 1',
      };

      final cycle = CycleMapper.fromJson(json);
      expect(cycle.id, 'c-1');
      expect(cycle.projectId, 'proj-1');
      expect(cycle.name, 'Sprint 1');
    });

    test('parses all fields', () {
      final json = <String, dynamic>{
        'id': 'c-1',
        'project': 'proj-1',
        'name': 'Sprint 1',
        'description': 'First sprint',
        'start_date': '2024-01-01',
        'end_date': '2024-01-14',
        'status': 'current',
        'total_issues': 10,
        'completed_issues': 5,
        'progress': 0.5,
      };

      final cycle = CycleMapper.fromJson(json);
      expect(cycle.description, 'First sprint');
      expect(cycle.startDate, isNotNull);
      expect(cycle.endDate, isNotNull);
      expect(cycle.status, CycleStatus.current);
      expect(cycle.totalIssues, 10);
      expect(cycle.completedIssues, 5);
      expect(cycle.progress, 0.5);
    });

    test('handles project_id key', () {
      final json = <String, dynamic>{
        'id': 'c-1',
        'project_id': 'proj-2',
        'name': 'Sprint',
      };
      final cycle = CycleMapper.fromJson(json);
      expect(cycle.projectId, 'proj-2');
    });
  });

  group('CycleMapper.toCompanion', () {
    test('converts entity to companion', () {
      final cycle = Cycle(
        id: 'c-1',
        projectId: 'proj-1',
        name: 'Sprint 1',
        status: CycleStatus.current,
        startDate: DateTime(2024),
        endDate: DateTime(2024, 1, 14),
      );

      final companion = CycleMapper.toCompanion(cycle);
      expect(companion.id.value, 'c-1');
      expect(companion.projectId.value, 'proj-1');
      expect(companion.name.value, 'Sprint 1');
      expect(companion.status.value, 0); // CycleStatus.current.index
    });
  });
}

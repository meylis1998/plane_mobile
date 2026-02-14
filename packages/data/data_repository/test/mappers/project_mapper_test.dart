import 'package:data_repository/src/mappers/project_mapper.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProjectMapper.fromJson', () {
    test('parses minimal JSON', () {
      final json = <String, dynamic>{
        'id': 'p-1',
        'workspace': 'ws-1',
        'name': 'My Project',
      };

      final project = ProjectMapper.fromJson(json);
      expect(project.id, 'p-1');
      expect(project.workspaceId, 'ws-1');
      expect(project.name, 'My Project');
    });

    test('parses all fields', () {
      final json = <String, dynamic>{
        'id': 'p-1',
        'workspace': 'ws-1',
        'name': 'My Project',
        'description': 'A project',
        'identifier': 'PRJ',
        'emoji': '123',
        'cover_image': 'https://img.com/cover.png',
        'network': 2,
        'is_archived': false,
        'is_favorite': true,
        'created_at': '2024-01-01T00:00:00Z',
        'updated_at': '2024-06-01T00:00:00Z',
      };

      final project = ProjectMapper.fromJson(json);
      expect(project.description, 'A project');
      expect(project.identifier, 'PRJ');
      expect(project.emoji, '123');
      expect(project.coverImage, 'https://img.com/cover.png');
      expect(project.network, ProjectNetwork.private_);
      expect(project.isArchived, isFalse);
      expect(project.isFavorite, isTrue);
      expect(project.createdAt, isNotNull);
    });

    test('handles workspace_id key', () {
      final json = <String, dynamic>{
        'id': 'p-1',
        'workspace_id': 'ws-2',
        'name': 'Project',
      };
      final project = ProjectMapper.fromJson(json);
      expect(project.workspaceId, 'ws-2');
    });
  });

  group('ProjectMapper.toCompanion', () {
    test('converts entity to companion', () {
      const project = Project(
        id: 'p-1',
        workspaceId: 'ws-1',
        name: 'My Project',
        isFavorite: true,
        network: ProjectNetwork.secret,
      );

      final companion = ProjectMapper.toCompanion(project);
      expect(companion.id.value, 'p-1');
      expect(companion.workspaceId.value, 'ws-1');
      expect(companion.name.value, 'My Project');
      expect(companion.isFavorite.value, isTrue);
      expect(companion.network.value, 0);
    });
  });
}

import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_search_provider.dart';
import 'package:feature_project/src/screens/project_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

List<Project> _sampleProjects() {
  return const [
    Project(
      id: 'p-1',
      workspaceId: 'ws-1',
      name: 'Mobile App',
      identifier: 'MOB',
      isFavorite: true,
    ),
    Project(
      id: 'p-2',
      workspaceId: 'ws-1',
      name: 'Backend API',
      identifier: 'API',
      isFavorite: false,
    ),
    Project(
      id: 'p-3',
      workspaceId: 'ws-1',
      name: 'Web Frontend',
      identifier: 'WEB',
      isFavorite: false,
    ),
  ];
}

Widget _buildApp({
  AsyncValue<List<Project>> projectsAsync = const AsyncValue.loading(),
  void Function(Project)? onProjectTap,
  VoidCallback? onCreateTap,
}) {
  return ProviderScope(
    overrides: [
      filteredProjectsProvider(workspaceSlug: 'test-ws').overrideWith(
        (ref) async {
          return projectsAsync.when(
            data: (projects) => projects,
            loading: () => throw Exception('loading'),
            error: (e, _) => throw e,
          );
        },
      ),
    ],
    child: MaterialApp(
      home: ProjectListScreen(
        workspaceSlug: 'test-ws',
        onProjectTap: onProjectTap,
        onCreateTap: onCreateTap,
      ),
    ),
  );
}

void main() {
  group('ProjectListScreen', () {
    testWidgets('shows app bar during loading', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      // App bar with title should be visible even while loading
      expect(find.text('Projects'), findsOneWidget);
    });

    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(
        _buildApp(projectsAsync: AsyncValue.data(_sampleProjects())),
      );
      await tester.pumpAndSettle();

      expect(find.text('Projects'), findsOneWidget);
    });

    testWidgets('shows FAB for creating projects', (tester) async {
      var fabTapped = false;
      await tester.pumpWidget(
        _buildApp(
          projectsAsync: AsyncValue.data(_sampleProjects()),
          onCreateTap: () => fabTapped = true,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      await tester.tap(find.byType(FloatingActionButton));
      expect(fabTapped, isTrue);
    });

    testWidgets('shows search icon in app bar', (tester) async {
      await tester.pumpWidget(
        _buildApp(projectsAsync: AsyncValue.data(_sampleProjects())),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('shows Favorites section when favorites exist', (tester) async {
      await tester.pumpWidget(
        _buildApp(projectsAsync: AsyncValue.data(_sampleProjects())),
      );
      await tester.pumpAndSettle();

      // PlaneSectionHeader renders title in uppercase
      expect(find.text('FAVORITES'), findsOneWidget);
      expect(find.text('ALL PROJECTS'), findsOneWidget);
    });

    testWidgets('shows empty view when no projects', (tester) async {
      await tester.pumpWidget(
        _buildApp(projectsAsync: const AsyncValue.data([])),
      );
      await tester.pumpAndSettle();

      expect(find.text('No projects yet'), findsOneWidget);
      expect(
        find.text('Create your first project to get started.'),
        findsOneWidget,
      );
    });

    testWidgets('shows error state with retry', (tester) async {
      await tester.pumpWidget(
        _buildApp(
          projectsAsync: AsyncValue.error(
            Exception('API error'),
            StackTrace.current,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Failed to load projects'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('displays project names', (tester) async {
      await tester.pumpWidget(
        _buildApp(projectsAsync: AsyncValue.data(_sampleProjects())),
      );
      await tester.pumpAndSettle();

      expect(find.text('Mobile App'), findsOneWidget);
      expect(find.text('Backend API'), findsOneWidget);
      expect(find.text('Web Frontend'), findsOneWidget);
    });
  });
}

import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:feature_work_items/src/screens/work_item_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

List<WorkItem> _sampleItems() {
  return [
    WorkItem(
      id: 'wi-1',
      projectId: 'proj-1',
      workspaceSlug: 'ws-1',
      name: 'Fix login bug',
      state: const WorkItemState(
        id: 'state-1',
        name: 'In Progress',
        group: StateGroup.started,
        color: '#FFA500',
        sequence: 2,
        projectId: 'proj-1',
      ),
      priority: Priority.high,
    ),
    WorkItem(
      id: 'wi-2',
      projectId: 'proj-1',
      workspaceSlug: 'ws-1',
      name: 'Add dashboard',
      state: const WorkItemState(
        id: 'state-2',
        name: 'Backlog',
        group: StateGroup.backlog,
        color: '#888888',
        sequence: 0,
        projectId: 'proj-1',
      ),
      priority: Priority.medium,
    ),
  ];
}

Widget _buildApp({
  AsyncValue<List<WorkItem>> itemsAsync = const AsyncValue.loading(),
  VoidCallback? onCreateTap,
}) {
  return ProviderScope(
    overrides: [
      workItemListProvider(
        workspaceSlug: 'test-ws',
        projectId: 'test-proj',
      ).overrideWith(() {
        return _FakeWorkItemList(itemsAsync);
      }),
    ],
    child: MaterialApp(
      home: WorkItemListScreen(
        workspaceSlug: 'test-ws',
        projectId: 'test-proj',
        onCreateTap: onCreateTap,
      ),
    ),
  );
}

class _FakeWorkItemList extends WorkItemList {
  _FakeWorkItemList(this._initialValue);
  final AsyncValue<List<WorkItem>> _initialValue;

  @override
  Future<List<WorkItem>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    return _initialValue.when(
      data: (items) => items,
      loading: () => throw Exception('loading'),
      error: (e, _) => throw e,
    );
  }

  @override
  Future<void> refresh() async {}
}

void main() {
  group('WorkItemListScreen', () {
    testWidgets('shows app bar title during loading', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      // App bar should be visible even while content is loading
      expect(find.text('Work Items'), findsOneWidget);
    });

    testWidgets('renders app bar title', (tester) async {
      await tester.pumpWidget(
        _buildApp(itemsAsync: AsyncValue.data(_sampleItems())),
      );
      await tester.pumpAndSettle();

      expect(find.text('Work Items'), findsOneWidget);
    });

    testWidgets('shows FAB for creating items', (tester) async {
      var fabTapped = false;
      await tester.pumpWidget(
        _buildApp(
          itemsAsync: AsyncValue.data(_sampleItems()),
          onCreateTap: () => fabTapped = true,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      await tester.tap(find.byType(FloatingActionButton));
      expect(fabTapped, isTrue);
    });

    testWidgets('shows view mode toggle icon', (tester) async {
      await tester.pumpWidget(
        _buildApp(itemsAsync: AsyncValue.data(_sampleItems())),
      );
      await tester.pumpAndSettle();

      // Default view mode is list, so toggle icon should be kanban
      expect(find.byIcon(Icons.view_kanban_rounded), findsOneWidget);
    });

    testWidgets('shows error state', (tester) async {
      await tester.pumpWidget(
        _buildApp(
          itemsAsync: AsyncValue.error(
            Exception('Network error'),
            StackTrace.current,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Failed to load work items'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}

import 'package:data_sync/src/conflict/conflict_resolver.dart';
import 'package:data_sync/src/conflict/conflict_store.dart';
import 'package:data_sync/src/models/conflict_result.dart';
import 'package:data_sync/src/models/conflict_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConflictStore store;
  late ConflictResolver resolver;

  setUp(() {
    store = ConflictStore();
    resolver = ConflictResolver(conflictStore: store);
  });

  tearDown(() {
    store.dispose();
  });

  final localData = {'name': 'Local Version'};
  final serverData = {'name': 'Server Version'};
  final localTime = DateTime(2024, 2);
  final serverTime = DateTime(2024, 1);

  group('ConflictResolver', () {
    test('noConflict returns local data', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.noConflict,
        strategy: ConflictStrategy.serverWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      expect(result, localData);
    });

    test('localNewer returns local data', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.localNewer,
        strategy: ConflictStrategy.serverWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      expect(result, localData);
    });

    test('serverNewer returns server data', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.serverNewer,
        strategy: ConflictStrategy.clientWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      expect(result, serverData);
    });

    test('trueConflict with serverWins returns server data', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.trueConflict,
        strategy: ConflictStrategy.serverWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      expect(result, serverData);
    });

    test('trueConflict with clientWins returns local data', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.trueConflict,
        strategy: ConflictStrategy.clientWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      expect(result, localData);
    });

    test('trueConflict with lastWriteWins returns newer data', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.trueConflict,
        strategy: ConflictStrategy.lastWriteWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      // localTime (Feb) is after serverTime (Jan)
      expect(result, localData);
    });

    test('trueConflict with lastWriteWins returns server when server is newer',
        () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.trueConflict,
        strategy: ConflictStrategy.lastWriteWins,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: DateTime(2024, 1),
        serverUpdatedAt: DateTime(2024, 3),
      );
      expect(result, serverData);
    });

    test('trueConflict with manual stores conflict and returns null', () {
      final result = resolver.resolve(
        conflictResult: ConflictResult.trueConflict,
        strategy: ConflictStrategy.manual,
        entityType: 'work_item',
        entityId: 'wi-1',
        localData: localData,
        serverData: serverData,
        localUpdatedAt: localTime,
        serverUpdatedAt: serverTime,
      );
      expect(result, isNull);
      expect(store.count, 1);
      final conflict = store.getConflicts().first;
      expect(conflict.entityType, 'work_item');
      expect(conflict.entityId, 'wi-1');
      expect(conflict.localData, localData);
      expect(conflict.serverData, serverData);
    });
  });
}

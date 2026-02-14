import 'package:core_di/src/providers/core_providers.dart';
import 'package:core_storage/core_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dao_providers.g.dart';

@Riverpod(keepAlive: true)
WorkspaceDao workspaceDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).workspaceDao;
}

@Riverpod(keepAlive: true)
MemberDao memberDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).memberDao;
}

@Riverpod(keepAlive: true)
ProjectDao projectDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).projectDao;
}

@Riverpod(keepAlive: true)
WorkItemDao workItemDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).workItemDao;
}

@Riverpod(keepAlive: true)
CycleDao cycleDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).cycleDao;
}

@Riverpod(keepAlive: true)
ModuleDao moduleDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).moduleDao;
}

@Riverpod(keepAlive: true)
StateDao stateDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).stateDao;
}

@Riverpod(keepAlive: true)
LabelDao labelDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).labelDao;
}

@Riverpod(keepAlive: true)
CommentDao commentDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).commentDao;
}

@Riverpod(keepAlive: true)
SyncQueueDao syncQueueDao(Ref ref) {
  return ref.watch(planeDatabaseProvider).syncQueueDao;
}

import 'package:core_di/src/providers/core_providers.dart';
import 'package:core_di/src/providers/dao_providers.dart';
import 'package:data_repository/data_repository.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
WorkspaceRepository workspaceRepository(Ref ref) {
  return WorkspaceRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
    workspaceDao: ref.watch(workspaceDaoProvider),
  );
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(Ref ref) {
  return ProjectRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
    projectDao: ref.watch(projectDaoProvider),
  );
}

@Riverpod(keepAlive: true)
WorkItemRepository workItemRepository(Ref ref) {
  return WorkItemRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
    workItemDao: ref.watch(workItemDaoProvider),
    stateDao: ref.watch(stateDaoProvider),
  );
}

@Riverpod(keepAlive: true)
CycleRepository cycleRepository(Ref ref) {
  return CycleRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
    cycleDao: ref.watch(cycleDaoProvider),
  );
}

@Riverpod(keepAlive: true)
ModuleRepository moduleRepository(Ref ref) {
  return ModuleRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
    moduleDao: ref.watch(moduleDaoProvider),
  );
}

@Riverpod(keepAlive: true)
CommentRepository commentRepository(Ref ref) {
  return CommentRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
    commentDao: ref.watch(commentDaoProvider),
  );
}

@Riverpod(keepAlive: true)
PageRepository pageRepository(Ref ref) {
  return PageRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
  );
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepositoryImpl(
    apiClient: ref.watch(planeApiClientProvider),
  );
}

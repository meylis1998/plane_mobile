import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_members_provider.g.dart';

@riverpod
class ProjectMembersNotifier extends _$ProjectMembersNotifier {
  @override
  Future<List<Member>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final members = ref.watch(
      workspaceMembersNotifierProvider(workspaceSlug: workspaceSlug),
    );
    return members;
  }
}

/// Provider for workspace members.
/// Must be overridden at the app level with a concrete implementation.
@Riverpod(keepAlive: true)
class WorkspaceMembersNotifier extends _$WorkspaceMembersNotifier {
  @override
  List<Member> build({required String workspaceSlug}) {
    throw UnimplementedError(
      'workspaceMembersNotifierProvider must be overridden',
    );
  }
}

import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspace_members_provider.g.dart';

/// Provider that exposes a list of workspace members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the workspace API to fetch members.
@riverpod
Future<List<Member>> workspaceMembers(
  Ref ref, {
  required String workspaceSlug,
}) async {
  // Stub: a real implementation would call
  // workspaceRepository.getMembers(workspaceSlug: workspaceSlug)
  return <Member>[];
}

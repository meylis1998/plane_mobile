import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_members_provider.g.dart';

/// Provider that exposes a list of project members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the project API to fetch members.
@riverpod
Future<List<Member>> projectMembers(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  // Stub: a real implementation would call
  // projectRepository.getMembers(workspaceSlug, projectId)
  return <Member>[];
}

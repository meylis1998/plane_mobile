import 'package:domain_core/domain_core.dart';
import 'package:feature_auth/src/models/auth_state.dart';
import 'package:feature_auth/src/providers/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspace_list_provider.g.dart';

@riverpod
List<Workspace> workspaceList(Ref ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return switch (authState) {
    Authenticated(:final workspaces) => workspaces,
    Unauthenticated() || Authenticating() || AuthError() => const [],
  };
}

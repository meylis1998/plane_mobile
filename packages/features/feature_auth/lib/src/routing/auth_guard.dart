import 'package:feature_auth/src/models/auth_state.dart';
import 'package:feature_auth/src/providers/auth_state_provider.dart';
import 'package:feature_auth/src/providers/selected_workspace_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Returns a GoRouter redirect function that guards routes based on
/// authentication and workspace selection state.
///
/// Usage with GoRouter:
/// ```dart
/// GoRouter(
///   redirect: authGuard(ref),
///   ...
/// )
/// ```
String? Function(dynamic context, dynamic goRouterState) authGuard(
  WidgetRef ref,
) {
  return (context, goRouterState) {
    final authState = ref.read(authStateNotifierProvider);
    final selectedWorkspace = ref.read(selectedWorkspaceProvider);
    final location = (goRouterState as dynamic).uri.toString();

    final isOnLogin = location == '/login';
    final isOnWorkspaceSelect = location == '/workspace-select';

    // Unauthenticated or error -> redirect to login
    if (authState is Unauthenticated || authState is AuthError) {
      return isOnLogin ? null : '/login';
    }

    // Still authenticating -> don't redirect (let loading show)
    if (authState is Authenticating) {
      return null;
    }

    // Authenticated but on login -> move forward
    if (authState is Authenticated && isOnLogin) {
      if (selectedWorkspace != null) {
        return '/';
      }
      return '/workspace-select';
    }

    // Authenticated but no workspace selected
    if (authState is Authenticated && selectedWorkspace == null) {
      return isOnWorkspaceSelect ? null : '/workspace-select';
    }

    // Authenticated with workspace but still on workspace-select
    if (authState is Authenticated &&
        selectedWorkspace != null &&
        isOnWorkspaceSelect) {
      return '/';
    }

    return null;
  };
}

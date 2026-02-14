import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.authenticating() = Authenticating;
  const factory AuthState.authenticated({
    required List<Workspace> workspaces,
  }) = Authenticated;
  const factory AuthState.error(String message) = AuthError;
}

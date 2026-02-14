import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspace_repository_provider.g.dart';

/// Stub provider for the workspace repository.
/// The actual implementation is wired in the data_repository package.
@Riverpod(keepAlive: true)
WorkspaceRepository workspaceRepository(Ref ref) {
  throw UnimplementedError(
    'workspaceRepositoryProvider must be overridden in ProviderScope',
  );
}

import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_repository_provider.g.dart';

/// Stub provider for the project repository.
/// The actual implementation is wired in the data_repository package.
@Riverpod(keepAlive: true)
ProjectRepository projectRepository(Ref ref) {
  throw UnimplementedError(
    'projectRepositoryProvider must be overridden in ProviderScope',
  );
}

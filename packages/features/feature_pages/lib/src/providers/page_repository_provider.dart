import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_repository_provider.g.dart';

/// Stub provider for the page repository.
/// The actual implementation is wired in the data_repository package
/// and overridden at app level via core_di ProviderScope.
@Riverpod(keepAlive: true)
PageRepository pageRepository(Ref ref) {
  throw UnimplementedError(
    'pageRepositoryProvider must be overridden in ProviderScope',
  );
}

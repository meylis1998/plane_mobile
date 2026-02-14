import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository_provider.g.dart';

/// Stub provider for the work item repository used by search.
/// The actual implementation is wired in the data_repository package.
@Riverpod(keepAlive: true)
WorkItemRepository searchWorkItemRepository(Ref ref) {
  throw UnimplementedError(
    'searchWorkItemRepositoryProvider must be overridden in ProviderScope',
  );
}

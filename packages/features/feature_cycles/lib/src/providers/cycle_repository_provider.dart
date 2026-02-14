import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_repository_provider.g.dart';

/// Stub provider for the cycle repository.
/// The actual implementation is wired in the data_repository package
/// and overridden at app level via core_di ProviderScope.
@Riverpod(keepAlive: true)
CycleRepository cycleRepository(Ref ref) {
  throw UnimplementedError(
    'cycleRepositoryProvider must be overridden in ProviderScope',
  );
}

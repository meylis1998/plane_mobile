import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository_provider.g.dart';

/// Stub provider for the notification repository.
/// The actual implementation is wired in the data_repository package.
@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) {
  throw UnimplementedError(
    'notificationRepositoryProvider must be overridden in ProviderScope',
  );
}

import 'package:ai_service/src/service/plane_ai_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_service_provider.g.dart';

/// Provides a singleton [PlaneAiService].
///
/// Must be overridden at the app level with the real API client.
@Riverpod(keepAlive: true)
PlaneAiService aiService(Ref ref) {
  throw UnimplementedError(
    'aiServiceProvider must be overridden in ProviderScope',
  );
}

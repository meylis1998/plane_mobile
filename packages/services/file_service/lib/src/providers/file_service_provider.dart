import 'package:core_network/core_network.dart';
import 'package:file_service/src/service/plane_file_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_service_provider.g.dart';

/// Provides a singleton [PlaneFileService] backed by the [PlaneApiClient].
///
/// Must be overridden at the app level with the real [PlaneApiClient].
@Riverpod(keepAlive: true)
PlaneFileService fileService(Ref ref) {
  throw UnimplementedError(
    'fileServiceProvider must be overridden in ProviderScope',
  );
}

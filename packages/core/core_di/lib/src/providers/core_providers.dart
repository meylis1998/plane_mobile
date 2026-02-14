import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core_di/src/adapters/secure_storage_adapter.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) {
  return SecureStorageService();
}

@Riverpod(keepAlive: true)
PlaneDatabase planeDatabase(Ref ref) {
  final db = PlaneDatabase();
  ref.onDispose(db.close);
  return db;
}

@Riverpod(keepAlive: true)
PlaneApiClient planeApiClient(Ref ref) {
  final storage = ref.watch(secureStorageServiceProvider);
  return PlaneApiClient(
    baseUrl: 'https://api.plane.so',
    tokenStorage: SecureStorageAdapter(storage),
  );
}

@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) {
  return Connectivity();
}

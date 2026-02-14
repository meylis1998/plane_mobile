/// Application environment configuration.
///
/// Reads configuration from `--dart-define` flags at build time.
/// Usage:
/// ```sh
/// flutter run --dart-define=ENV=dev --dart-define=BASE_URL=https://api.plane.so
/// ```
enum Environment {
  /// Local development with verbose logging.
  dev,

  /// Staging environment for QA testing.
  staging,

  /// Production release.
  production;

  /// Parses the environment from a string value.
  ///
  /// Defaults to [Environment.dev] if the value is not recognized.
  static Environment fromString(String value) {
    return Environment.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => Environment.dev,
    );
  }
}

/// Holds runtime configuration resolved from `--dart-define` values.
class EnvironmentConfig {
  const EnvironmentConfig._({
    required this.environment,
    required this.baseUrl,
    required this.enableLogging,
    required this.syncIntervalMinutes,
  });

  /// Creates an [EnvironmentConfig] from `--dart-define` compile-time values.
  ///
  /// Supported defines:
  /// - `ENV` — one of `dev`, `staging`, `production` (default: `dev`)
  /// - `BASE_URL` — API base URL (default: `https://api.plane.so`)
  /// - `ENABLE_LOGGING` — `true` or `false` (default: `true` for dev)
  /// - `SYNC_INTERVAL_MINUTES` — periodic sync interval (default: `5`)
  factory EnvironmentConfig.fromDartDefines() {
    const envString = String.fromEnvironment('ENV', defaultValue: 'dev');
    final environment = Environment.fromString(envString);

    const baseUrl = String.fromEnvironment(
      'BASE_URL',
      defaultValue: 'https://api.plane.so',
    );

    const enableLoggingStr = String.fromEnvironment('ENABLE_LOGGING');
    final enableLogging =
        enableLoggingStr.isEmpty
            ? environment != Environment.production
            : enableLoggingStr.toLowerCase() == 'true';

    const syncIntervalStr = String.fromEnvironment(
      'SYNC_INTERVAL_MINUTES',
      defaultValue: '5',
    );
    final syncIntervalMinutes = int.tryParse(syncIntervalStr) ?? 5;

    return EnvironmentConfig._(
      environment: environment,
      baseUrl: baseUrl,
      enableLogging: enableLogging,
      syncIntervalMinutes: syncIntervalMinutes,
    );
  }

  /// The current environment (dev, staging, production).
  final Environment environment;

  /// The Plane API base URL.
  final String baseUrl;

  /// Whether debug logging is enabled.
  final bool enableLogging;

  /// Periodic sync interval in minutes.
  final int syncIntervalMinutes;

  /// Whether the app is running in production mode.
  bool get isProduction => environment == Environment.production;

  /// Whether the app is running in development mode.
  bool get isDev => environment == Environment.dev;
}

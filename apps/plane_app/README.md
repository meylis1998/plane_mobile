# Plane Mobile App

The main Flutter application for [Plane](https://plane.so) — an open-source project management platform. This app provides a full-featured mobile client for managing workspaces, projects, work items, cycles, modules, pages, and more.

## Prerequisites

- **Flutter SDK** >= 3.38.0 (Dart >= 3.10.0)
- **Melos** — install globally: `dart pub global activate melos`
- **Xcode** (macOS, for iOS builds)
- **Android Studio** or Android SDK (for Android builds)

## Setup

1. **Clone the repository** and navigate to the project root:

   ```sh
   cd plane_mobile
   ```

2. **Bootstrap all packages** with Melos:

   ```sh
   melos bootstrap
   ```

3. **Run code generation** (Freezed, Drift, Riverpod):

   ```sh
   melos run build_runner
   ```

   Or for a specific package:

   ```sh
   cd packages/domain/domain_core
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Copy environment config**:

   ```sh
   cp apps/plane_app/.env.example apps/plane_app/.env
   ```

   Edit `.env` with your Plane instance URL and settings.

## Running the App

### Development (default)

```sh
flutter run
```

### With environment overrides

```sh
flutter run \
  --dart-define=ENV=dev \
  --dart-define=BASE_URL=https://api.plane.so \
  --dart-define=ENABLE_LOGGING=true
```

### Staging

```sh
flutter run --dart-define=ENV=staging --dart-define=BASE_URL=https://staging-api.plane.so
```

### Production

```sh
flutter run --release --dart-define=ENV=production --dart-define=BASE_URL=https://api.plane.so
```

## Building for Release

### Android APK

```sh
flutter build apk --release \
  --dart-define=ENV=production \
  --dart-define=BASE_URL=https://api.plane.so
```

### Android App Bundle (Play Store)

```sh
flutter build appbundle --release \
  --dart-define=ENV=production \
  --dart-define=BASE_URL=https://api.plane.so
```

### iOS

```sh
flutter build ios --release \
  --dart-define=ENV=production \
  --dart-define=BASE_URL=https://api.plane.so
```

Then archive and upload via Xcode or fastlane.

## Fastlane

Fastlane lanes are configured in `fastlane/Fastfile`:

```sh
# iOS
cd apps/plane_app
bundle exec fastlane ios build_ios
bundle exec fastlane ios beta        # Upload to TestFlight

# Android
bundle exec fastlane android build_aab
bundle exec fastlane android beta    # Upload to Play Store internal track
```

## Static Analysis

```sh
dart analyze
```

## Architecture

This app follows **Clean Architecture** with a monorepo managed by Melos. See the root [CLAUDE.md](../../CLAUDE.md) for the full architecture overview, package structure, and coding conventions.

Key layers:
- **Presentation** — Flutter widgets, Riverpod providers, GoRouter navigation
- **Domain** — Freezed entities, use cases, repository interfaces
- **Data** — Repository implementations, Drift database, Dio API client
- **Core** — Networking, storage, dependency injection, real-time sync

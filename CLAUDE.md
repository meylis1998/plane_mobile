# Plane Flutter Mobile App

## Project Overview
A Flutter mobile app for Plane (open-source project management platform).
Full plan: `../PLANE_FLUTTER_APP_PLAN.md`

## Architecture
- **Clean Architecture**: Presentation → Domain → Data → Core
- **State Management**: Riverpod with code generation (`riverpod_annotation`, `riverpod_generator`)
- **Local DB**: Drift (SQLite)
- **Network**: Dio with interceptors
- **Navigation**: GoRouter
- **Serialization**: Freezed + json_serializable
- **Monorepo**: Managed by Melos

## Project Structure
```
plane_mobile/
├── apps/plane_app/           # Main Flutter application
├── packages/
│   ├── core/
│   │   ├── core_foundation/  # Either, Failure, typedefs, extensions
│   │   ├── core_network/     # Dio API client, interceptors, pagination
│   │   ├── core_storage/     # Drift database, secure storage
│   │   ├── core_realtime/    # WebSocket client (Hocuspocus)
│   │   └── core_di/          # Dependency injection setup
│   ├── domain/
│   │   └── domain_core/      # Entities (Freezed), use cases, repository interfaces
│   ├── data/
│   │   ├── data_repository/  # Repository implementations
│   │   └── data_sync/        # Offline sync engine
│   ├── features/
│   │   ├── feature_auth/
│   │   ├── feature_workspace/
│   │   ├── feature_project/
│   │   ├── feature_work_items/
│   │   ├── feature_cycles/
│   │   ├── feature_modules/
│   │   ├── feature_pages/
│   │   ├── feature_search/
│   │   └── feature_notifications/
│   ├── presentation/
│   │   ├── ui_components/    # Shared widget library
│   │   └── theme/            # Design system, colors, typography
│   └── services/
│       ├── file_service/     # File upload/download
│       └── ai_service/       # AI features (OpenAI)
```

## Coding Conventions
- All entities use `@freezed` with `_$ClassName` mixin
- All providers use `@riverpod` or `@Riverpod(keepAlive: true)` annotations
- Repository methods return `Future<Either<Failure, T>>`
- File naming: `snake_case.dart`
- One public class per file
- Barrel exports via `package_name.dart` in each package's `lib/`
- Tests mirror `lib/` structure under `test/`

## Plane API
- Auth: `X-API-Key: plane_api_<token>` header
- Base URL: configurable (Cloud: `https://api.plane.so`, self-hosted: custom)
- Pagination: cursor-based `?cursor=value:offset:is_prev`
- Rate limit: 60 requests/minute per API key
- Response headers: `X-RateLimit-Remaining`, `X-RateLimit-Reset`
- Expand related: `?expand=assignees,state,labels,created_by`
- Field selection: `?fields=id,name,state,priority`

## Key Packages
- `flutter_riverpod: ^2.6.1` / `riverpod_annotation: ^2.5.0`
- `dio: ^5.8.0`
- `drift: ^2.23.1` / `drift_flutter: ^0.2.4`
- `freezed_annotation: ^2.4.4` / `freezed: ^2.5.7`
- `go_router: ^14.8.1`
- `fl_chart: ^0.70.2`
- `flutter_quill: ^11.1.0`

## Data Models
- `WorkItem`: id, projectId, workspaceSlug, name, description, state, priority, dates, assignees, labels, sync metadata
- `Project`: id, workspaceId, name, identifier, emoji, coverImage, network, states, labels
- `Cycle`: id, projectId, name, startDate, endDate, status, progress
- `Module`: id, projectId, name, description, status
- Enums: `Priority` (urgent/high/medium/low/none), `StateGroup` (backlog/unstarted/started/completed/cancelled), `CycleStatus`, `PageAccess`

## Important Rules
- NEVER edit `melos.yaml` or root config unless you are the scaffold teammate
- NEVER modify another teammate's package without coordination
- Run `melos bootstrap` after adding dependencies
- Run `dart run build_runner build` in a package after modifying Freezed/Drift/Riverpod annotated files
- Use `dartz` or custom `Either` type for error handling — no exceptions for expected failures

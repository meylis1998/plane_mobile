# Plane Flutter Mobile App - Comprehensive Development Plan

## Executive Summary

This document outlines a complete plan for building a **Flutter mobile application** for **Plane** - an open-source project management platform (44.2k GitHub stars) that serves as an alternative to Jira, Linear, Monday.com, and ClickUp.

---

## Table of Contents

1. [Plane Platform Analysis](#1-plane-platform-analysis)
2. [Feature Requirements](#2-feature-requirements)
3. [Technical Architecture](#3-technical-architecture)
4. [API Integration](#4-api-integration)
5. [Data Models](#5-data-models)
6. [Project Structure](#6-project-structure)
7. [State Management](#7-state-management)
8. [Offline Sync Strategy](#8-offline-sync-strategy)
9. [Real-time Collaboration](#9-real-time-collaboration)
10. [UI/UX Design](#10-uiux-design)
11. [Testing Strategy](#11-testing-strategy)
12. [Development Phases](#12-development-phases)
13. [Package Dependencies](#13-package-dependencies)

---

## 1. Plane Platform Analysis

### 1.1 What is Plane?

Plane is an open-source project management tool that enables teams to:
- Track issues and work items
- Run sprints/cycles
- Manage product roadmaps
- Collaborate on documentation
- Integrate with GitHub, Slack, and other tools

### 1.2 Technology Stack

| Component | Technology |
|-----------|------------|
| **Frontend** | React, TypeScript (75%), Next.js, Vite |
| **Backend** | Django REST Framework (Python 21.7%) |
| **Database** | PostgreSQL |
| **Cache** | Redis/Valkey |
| **Message Queue** | RabbitMQ (Celery) |
| **Real-time** | Hocuspocus (WebSocket), Yjs (CRDTs) |
| **File Storage** | S3/MinIO |
| **AI** | OpenAI GPT integration |

### 1.3 Current Mobile App Status

Plane has official iOS/Android apps with limitations:
- **Requires Commercial Edition** for self-hosted (v1.5.0+)
- **No sign-up on mobile** - must join workspace first
- **Push notifications** only for Cloud users
- Community Edition users have **no mobile access**

### 1.4 Flutter App Opportunity

| Opportunity | Value Proposition |
|-------------|-------------------|
| Community Edition Support | Serve self-hosted users excluded from official app |
| Offline-First | Superior offline experience with sync |
| White-Label | Brandable solution for enterprises |
| Cross-Platform | Single codebase for iOS, Android, Web, Desktop |
| Feature Parity+ | Match and exceed official app features |

---

## 2. Feature Requirements

### 2.1 Core Features (MVP)

#### Authentication & Workspaces
- [ ] API Key authentication
- [ ] OAuth 2.0 support (future)
- [ ] Workspace listing and switching
- [ ] Member roles and permissions

#### Projects
- [ ] Project list with search/filter
- [ ] Project details and settings
- [ ] Project favorites
- [ ] Member management

#### Work Items (Issues)
- [ ] Full CRUD operations
- [ ] Multiple views: List, Kanban, Calendar
- [ ] State management (Backlog, Started, Completed, etc.)
- [ ] Priority levels (Urgent, High, Medium, Low, None)
- [ ] Assignees management
- [ ] Labels
- [ ] Due dates and start dates
- [ ] Parent/child relationships (sub-tasks)
- [ ] Comments and activity feed
- [ ] File attachments
- [ ] Search functionality

#### Cycles (Sprints)
- [ ] Cycle list and details
- [ ] Progress tracking
- [ ] Burn-down charts
- [ ] Issue assignment to cycles

#### Modules
- [ ] Module list and details
- [ ] Progress tracking
- [ ] Issue grouping

### 2.2 Enhanced Features

#### Documentation (Pages)
- [ ] Page listing with hierarchy
- [ ] Rich text editor
- [ ] Page access controls
- [ ] Favorites

#### Notifications
- [ ] Push notifications (FCM)
- [ ] In-app notification center
- [ ] Read/unread management
- [ ] Notification preferences

#### Offline Support
- [ ] Local data caching
- [ ] Offline create/update/delete
- [ ] Conflict resolution
- [ ] Background sync

### 2.3 Advanced Features

#### AI Integration
- [ ] AI-powered text improvement
- [ ] Grammar checking
- [ ] Content summarization
- [ ] Tone adjustment

#### Real-time Collaboration
- [ ] Live updates via WebSocket
- [ ] Collaborative editing (Pages)
- [ ] Presence indicators

#### Analytics
- [ ] Project analytics dashboard
- [ ] Cycle analytics
- [ ] Workload distribution

---

## 3. Technical Architecture

### 3.1 Clean Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                        │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   Screens   │  │   Widgets   │  │   View Controllers  │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
│                           │                                  │
│                    Riverpod Providers                        │
└─────────────────────────────────────────────────────────────┘
                            │
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │  Entities   │  │  Use Cases  │  │  Repository Interfaces│ │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                            │
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                             │
│  ┌─────────────────────┐  ┌─────────────────────────────┐   │
│  │  Repository Impls   │  │      Data Sources           │   │
│  │  - WorkItemRepo     │  │  ┌─────────┐  ┌──────────┐  │   │
│  │  - ProjectRepo      │  │  │ Remote  │  │  Local   │  │   │
│  │  - CycleRepo        │  │  │ (API)   │  │  (Drift) │  │   │
│  └─────────────────────┘  │  └─────────┘  └──────────┘  │   │
│                           └─────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            │
┌─────────────────────────────────────────────────────────────┐
│                       CORE LAYER                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────────┐  │
│  │ Network  │  │ Storage  │  │ Realtime │  │ Foundation │  │
│  │  (Dio)   │  │ (Drift)  │  │   (WS)   │  │  (Utils)   │  │
│  └──────────┘  └──────────┘  └──────────┘  └────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### 3.2 System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     FLUTTER MOBILE APP                           │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    Presentation Layer                        ││
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────────┐   ││
│  │  │ Projects │  │  Issues  │  │  Cycles  │  │   Pages    │   ││
│  │  └──────────┘  └──────────┘  └──────────┘  └────────────┘   ││
│  └─────────────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    State Management                          ││
│  │                   Riverpod Providers                         ││
│  └─────────────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    Services Layer                            ││
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────────┐   ││
│  │  │   API    │  │  Sync    │  │WebSocket │  │   Push     │   ││
│  │  │  Client  │  │  Engine  │  │  Client  │  │   Notif    │   ││
│  │  └──────────┘  └──────────┘  └──────────┘  └────────────┘   ││
│  └─────────────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    Local Storage                             ││
│  │  ┌──────────┐  ┌──────────┐  ┌──────────────────────────┐   ││
│  │  │  Drift   │  │  Secure  │  │     File Cache           │   ││
│  │  │  (SQL)   │  │  Storage │  │                          │   ││
│  │  └──────────┘  └──────────┘  └──────────────────────────┘   ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      PLANE BACKEND                               │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │   REST API      │  │   WebSocket     │  │    Storage      │  │
│  │   (Django)      │  │   (Hocuspocus)  │  │    (S3/MinIO)   │  │
│  │   Port: 8000    │  │   Port: 3000    │  │                 │  │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘  │
│                              │                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │   PostgreSQL    │  │     Redis       │  │    RabbitMQ     │  │
│  │                 │  │                 │  │    (Celery)     │  │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 4. API Integration

### 4.1 Authentication

```
Header: X-API-Key: plane_api_<token>
Base URL: https://api.plane.so (Cloud) or custom domain (Self-hosted)
```

### 4.2 Core API Endpoints

#### Workspaces
```
GET    /api/v1/workspaces/
GET    /api/v1/workspaces/{slug}/
GET    /api/v1/workspaces/{slug}/members/
```

#### Projects
```
GET    /api/v1/workspaces/{slug}/projects/
POST   /api/v1/workspaces/{slug}/projects/
GET    /api/v1/workspaces/{slug}/projects/{id}/
PATCH  /api/v1/workspaces/{slug}/projects/{id}/
DELETE /api/v1/workspaces/{slug}/projects/{id}/
```

#### Work Items (Issues)
```
GET    /api/v1/workspaces/{slug}/projects/{id}/work-items/
POST   /api/v1/workspaces/{slug}/projects/{id}/work-items/
GET    /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/
PATCH  /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/
DELETE /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/
GET    /api/v1/workspaces/{slug}/work-items/search/?q={query}
```

#### Cycles
```
GET    /api/v1/workspaces/{slug}/projects/{id}/cycles/
POST   /api/v1/workspaces/{slug}/projects/{id}/cycles/
GET    /api/v1/workspaces/{slug}/projects/{id}/cycles/{cycle_id}/
PATCH  /api/v1/workspaces/{slug}/projects/{id}/cycles/{cycle_id}/
```

#### Modules
```
GET    /api/v1/workspaces/{slug}/projects/{id}/modules/
POST   /api/v1/workspaces/{slug}/projects/{id}/modules/
GET    /api/v1/workspaces/{slug}/projects/{id}/modules/{module_id}/
```

#### Comments & Activities
```
GET    /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/comments/
POST   /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/comments/
GET    /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/activities/
```

#### States & Labels
```
GET    /api/v1/workspaces/{slug}/projects/{id}/states/
GET    /api/v1/workspaces/{slug}/projects/{id}/labels/
```

#### File Attachments
```
POST   /api/v1/workspaces/{slug}/projects/{id}/work-items/{work_item_id}/attachments/
GET    /api/v1/workspaces/{slug}/file-assets/{id}/
```

### 4.3 Pagination

Plane uses cursor-based pagination:
```
?cursor=value:offset:is_prev
- value: Page size (max 100)
- offset: Current page number (0-indexed)
- is_prev: 0 for next, 1 for previous
```

### 4.4 Query Parameters

```
?expand=assignees,state,labels,created_by  # Include nested objects
?fields=id,name,state,priority              # Select specific fields
?order_by=-created_at                       # Sort order
?state__group=started                       # Filter by state group
?priority=high                              # Filter by priority
```

### 4.5 Rate Limiting

- **Limit**: 60 requests/minute per API key
- **Headers**: `X-RateLimit-Remaining`, `X-RateLimit-Reset`

---

## 5. Data Models

### 5.1 Core Entities

#### WorkItem (Issue)
```dart
@freezed
class WorkItem with _$WorkItem {
  const factory WorkItem({
    required String id,
    required String projectId,
    required String workspaceSlug,
    required String name,
    String? description,
    String? descriptionHtml,
    required WorkItemState state,
    required Priority priority,
    DateTime? startDate,
    DateTime? targetDate,
    String? parentId,
    int? sequenceId,
    int sortOrder,
    List<String>? assigneeIds,
    List<String>? labelIds,
    String? cycleId,
    String? moduleId,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? estimate,
    // Sync metadata
    @Default(false) bool isDirty,
    @Default(0) int localVersion,
    int? serverVersion,
  }) = _WorkItem;
}
```

#### Project
```dart
@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String workspaceId,
    required String name,
    String? description,
    String? identifier,
    String? emoji,
    String? coverImage,
    ProjectNetwork network,
    @Default(false) bool isArchived,
    @Default(false) bool isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WorkItemState>? states,
    List<Label>? labels,
  }) = _Project;
}
```

#### Cycle
```dart
@freezed
class Cycle with _$Cycle {
  const factory Cycle({
    required String id,
    required String projectId,
    required String name,
    String? description,
    required DateTime startDate,
    required DateTime endDate,
    CycleStatus? status,
    int? totalIssues,
    int? completedIssues,
    double? progress,
    List<CycleProgressSnapshot>? progressHistory,
  }) = _Cycle;
}
```

### 5.2 Enums

```dart
enum Priority { urgent, high, medium, low, none }

enum StateGroup { backlog, unstarted, started, completed, cancelled }

enum CycleStatus { current, upcoming, completed, draft }

enum PageAccess { public, private }
```

---

## 6. Project Structure

```
plane_mobile/
├── melos.yaml                          # Monorepo configuration
├── analysis_options.yaml
├── pubspec.yaml
│
├── apps/
│   └── plane_app/                      # Main application
│       ├── lib/
│       │   ├── main.dart
│       │   ├── app.dart
│       │   ├── bootstrap.dart
│       │   └── router/
│       │       └── app_router.dart
│       ├── android/
│       ├── ios/
│       └── test/
│
├── packages/
│   ├── core/
│   │   ├── core_foundation/            # Either, Failure, typedefs
│   │   ├── core_network/               # API client, interceptors
│   │   ├── core_storage/               # Drift database, secure storage
│   │   ├── core_realtime/              # WebSocket client
│   │   └── core_di/                    # Dependency injection
│   │
│   ├── domain/
│   │   └── domain_core/                # Entities, use cases, repo interfaces
│   │
│   ├── data/
│   │   ├── data_repository/            # Repository implementations
│   │   └── data_sync/                  # Offline sync engine
│   │
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
│   │
│   ├── presentation/
│   │   ├── ui_components/              # Shared UI library
│   │   └── theme/                      # Design system
│   │
│   └── services/
│       ├── file_service/               # File upload/download
│       └── ai_service/                 # AI features
│
└── docs/
```

---

## 7. State Management

### 7.1 Riverpod Architecture

```dart
// Repository Provider (Singleton)
@Riverpod(keepAlive: true)
WorkItemRepository workItemRepository(Ref ref) {
  return WorkItemRepository(
    apiService: ref.watch(planeApiServiceProvider),
    localDataSource: ref.watch(workItemLocalDataSourceProvider),
    syncEngine: ref.watch(syncEngineProvider),
    connectivity: ref.watch(connectivityServiceProvider),
  );
}

// List Provider (Auto-dispose)
@riverpod
class WorkItemList extends _$WorkItemList {
  @override
  Future<List<WorkItem>> build({
    required String workspaceSlug,
    required String projectId,
    WorkItemFilter? filter,
  }) async {
    final repository = ref.watch(workItemRepositoryProvider);
    final result = await repository.getWorkItems(...);
    return result.fold((failure) => throw failure, (items) => items);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
  }
}

// Detail Provider with Mutations
@riverpod
class WorkItemDetail extends _$WorkItemDetail {
  @override
  Future<WorkItem> build({...}) async { ... }

  Future<void> updateState(WorkItemState newState) async {
    // Optimistic update
    final current = state.valueOrNull;
    state = AsyncValue.data(current!.copyWith(state: newState));

    // API call
    final result = await repository.updateWorkItem(...);

    // Handle result (rollback on error)
  }
}
```

### 7.2 Provider Organization

```
providers/
├── auth_providers.dart          # Auth state, current user
├── workspace_providers.dart     # Workspace list, current workspace
├── project_providers.dart       # Project list, detail, settings
├── work_item_providers.dart     # Issue list, detail, filters
├── cycle_providers.dart         # Cycle list, detail, analytics
├── sync_providers.dart          # Sync status, pending count
└── notification_providers.dart  # Notifications, unread count
```

---

## 8. Offline Sync Strategy

### 8.1 Sync Engine Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      SYNC ENGINE                             │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐  │
│  │  Sync Queue  │    │   Conflict   │    │   Entity     │  │
│  │              │───▶│   Resolver   │───▶│   Handlers   │  │
│  │  (Priority)  │    │              │    │              │  │
│  └──────────────┘    └──────────────┘    └──────────────┘  │
│         │                    │                    │         │
│         ▼                    ▼                    ▼         │
│  ┌──────────────────────────────────────────────────────┐  │
│  │                   LOCAL DATABASE                      │  │
│  │  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────────┐  │  │
│  │  │ Items  │  │ Queue  │  │ Sync   │  │ Conflicts  │  │  │
│  │  │        │  │        │  │ Meta   │  │            │  │  │
│  │  └────────┘  └────────┘  └────────┘  └────────────┘  │  │
│  └──────────────────────────────────────────────────────┘  │
│                              │                              │
└──────────────────────────────┼──────────────────────────────┘
                               │
                               ▼
                    ┌──────────────────┐
                    │   PLANE API      │
                    └──────────────────┘
```

### 8.2 Sync Operations

1. **Create (Offline)**
   - Generate local UUID
   - Save to local DB with `isDirty: true`
   - Queue for sync with priority 10

2. **Update (Offline)**
   - Apply changes locally
   - Increment `localVersion`
   - Queue for sync with priority 5

3. **Delete (Offline)**
   - Mark as deleted locally
   - Queue for sync with priority 10

4. **Sync Process**
   - Check connectivity
   - Process queue by priority
   - Handle conflicts (last-write-wins or manual)
   - Update local with server response

### 8.3 Conflict Resolution

```dart
enum ConflictStrategy {
  serverWins,    // Always use server version
  clientWins,    // Always use local version
  lastWriteWins, // Compare timestamps
  manual,        // Prompt user to resolve
}
```

---

## 9. Real-time Collaboration

### 9.1 WebSocket Integration

```dart
class HocuspocusClient {
  /// Connect to document for real-time editing
  Future<void> connectToDocument({
    required String workspaceSlug,
    required String pageId,
  }) async {
    final uri = Uri.parse('$baseUrl/collaboration/$workspaceSlug/$pageId');
    _channel = WebSocketChannel.connect(uri);

    _channel.stream.listen(
      _handleMessage,
      onError: _handleError,
      onDone: _handleDisconnect,
    );
  }

  /// Send Yjs update
  void sendUpdate(Uint8List update) {
    _channel.sink.add(jsonEncode({
      'type': 'update',
      'data': base64Encode(update),
    }));
  }
}
```

### 9.2 Real-time Events

- Issue created/updated/deleted
- Comment added
- State changes
- Assignee changes
- Cycle updates

---

## 10. UI/UX Design

### 10.1 Navigation Structure

```
Bottom Navigation:
├── Projects (Home)
│   ├── Project List
│   └── Project Detail
│       ├── Issues (List/Kanban/Calendar)
│       ├── Cycles
│       ├── Modules
│       └── Pages
├── Cycles (All)
├── Search
└── Profile
    ├── Settings
    └── Notifications
```

### 10.2 Screen Inventory

| Screen | Features |
|--------|----------|
| Login | API key input, workspace URL |
| Workspace Selection | List workspaces, switch |
| Project List | Search, filter, favorites |
| Project Detail | Overview, quick actions |
| Issue List | List/Kanban/Calendar views |
| Issue Detail | Full CRUD, comments, activity |
| Issue Create/Edit | Form with all fields |
| Cycle List | Active, upcoming, completed |
| Cycle Detail | Progress, burndown chart |
| Page List | Hierarchy view |
| Page Editor | Rich text editing |
| Search | Global search |
| Notifications | Inbox |
| Settings | Preferences |

### 10.3 View Modes

**Kanban Board**
- Columns by state
- Drag-and-drop between states
- Quick actions on cards

**List View**
- Sortable table
- Inline editing
- Bulk actions

**Calendar View**
- Month/week views
- Due date visualization
- Quick add

---

## 11. Testing Strategy

### 11.1 Test Types

| Type | Coverage Target | Tools |
|------|-----------------|-------|
| Unit | 80%+ | flutter_test, mocktail |
| Widget | 70%+ | flutter_test |
| Integration | Critical flows | integration_test |
| E2E | Happy paths | patrol |

### 11.2 Test Structure

```
test/
├── unit/
│   ├── repositories/
│   ├── use_cases/
│   └── providers/
├── widget/
│   ├── screens/
│   └── components/
└── integration/
    └── flows/
```

---

## 12. Development Phases

### Phase 1: Foundation (Weeks 1-2)
- [ ] Project setup with Melos
- [ ] Core packages (network, storage, foundation)
- [ ] API client implementation
- [ ] Authentication flow
- [ ] Basic navigation

### Phase 2: Core Features (Weeks 3-5)
- [ ] Workspace & Project modules
- [ ] Work Items CRUD
- [ ] List and Kanban views
- [ ] Basic offline caching
- [ ] States, Labels, Priorities

### Phase 3: Sprint Features (Weeks 6-7)
- [ ] Cycles implementation
- [ ] Modules implementation
- [ ] Progress tracking
- [ ] Burn-down charts

### Phase 4: Collaboration (Weeks 8-9)
- [ ] Comments system
- [ ] Activity feed
- [ ] File attachments
- [ ] Search functionality

### Phase 5: Sync & Real-time (Weeks 10-11)
- [ ] Full offline sync engine
- [ ] Conflict resolution
- [ ] WebSocket integration
- [ ] Push notifications

### Phase 6: Advanced Features (Weeks 12-14)
- [ ] Pages/Wiki
- [ ] Calendar view
- [ ] AI features
- [ ] Analytics dashboards

### Phase 7: Polish & Launch (Weeks 15-16)
- [ ] UI/UX refinement
- [ ] Performance optimization
- [ ] Testing completion
- [ ] App store preparation

---

## 13. Package Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.5.0

  # Networking
  dio: ^5.8.0
  connectivity_plus: ^6.1.1

  # Local Database
  drift: ^2.23.1
  drift_flutter: ^0.2.4
  sqlite3_flutter_libs: ^0.5.28

  # Secure Storage
  flutter_secure_storage: ^9.2.3
  shared_preferences: ^2.5.0

  # Navigation
  go_router: ^14.8.1

  # Real-time
  web_socket_channel: ^3.0.2

  # Push Notifications
  firebase_messaging: ^15.2.1
  firebase_core: ^3.13.0
  flutter_local_notifications: ^18.0.1

  # Serialization
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Utilities
  uuid: ^4.5.1
  intl: ^0.19.0
  collection: ^1.19.1
  equatable: ^2.0.7
  path_provider: ^2.1.5

  # UI Components
  cached_network_image: ^3.4.1
  flutter_svg: ^2.0.17
  shimmer: ^3.0.0

  # Charts
  fl_chart: ^0.70.2

  # Drag and Drop
  flutter_reorderable_grid_view: ^6.0.0

  # Rich Text Editor
  flutter_quill: ^11.1.0

  # File Handling
  file_picker: ^8.1.7
  image_picker: ^1.1.2

dev_dependencies:
  build_runner: ^2.4.14
  riverpod_generator: ^2.6.1
  freezed: ^2.5.7
  json_serializable: ^6.9.0
  drift_dev: ^2.23.1
  mocktail: ^1.0.4
  very_good_analysis: ^6.0.0
```

---

## Appendix A: API Client Implementation

```dart
class PlaneApiClient implements ApiClient {
  PlaneApiClient({
    required String baseUrl,
    required SecureStorageService secureStorage,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: const Duration(seconds: 15),
           receiveTimeout: const Duration(seconds: 20),
           headers: {
             'Content-Type': 'application/json',
             'Accept': 'application/json',
           },
         ),
       ) {
    _dio.interceptors.addAll([
      PlaneAuthInterceptor(secureStorage),
      RetryInterceptor(),
      LoggingInterceptor(),
    ]);
  }

  final Dio _dio;
}

class PlaneAuthInterceptor extends Interceptor {
  PlaneAuthInterceptor(this._secureStorage);

  final SecureStorageService _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final apiKey = await _secureStorage.getApiKey();
    if (apiKey != null) {
      options.headers['X-API-Key'] = apiKey;
    }
    handler.next(options);
  }
}
```

---

## Appendix B: Kanban Implementation

```dart
@riverpod
class KanbanBoard extends _$KanbanBoard {
  @override
  Future<Map<String, List<WorkItem>>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final items = await ref.watch(workItemListProvider(...).future);
    final states = await ref.watch(projectStatesProvider(...).future);

    // Group items by state
    final grouped = <String, List<WorkItem>>{};
    for (final state in states) {
      grouped[state.id] = items
          .where((item) => item.state.id == state.id)
          .toList()
        ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    }

    return grouped;
  }

  Future<void> moveItem({
    required String itemId,
    required String fromStateId,
    required String toStateId,
    required int newIndex,
  }) async {
    // Optimistic update + API call + rollback on error
  }
}
```

---

## Sources

- [Plane GitHub Repository](https://github.com/makeplane/plane)
- [Plane Official Website](https://plane.so)
- [Plane API Documentation](https://developers.plane.so)
- [Plane Mobile Documentation](https://docs.plane.so/devices/mobile)
- [Plane Changelog](https://plane.so/changelog/mobile)

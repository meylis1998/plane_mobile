/// Data sync package - Offline sync engine with conflict resolution.
library data_sync;

// Conflict
export 'src/conflict/conflict_detector.dart';
export 'src/conflict/conflict_resolver.dart';
export 'src/conflict/conflict_store.dart';

// Engine
export 'src/engine/sync_engine.dart';
export 'src/engine/sync_queue_manager.dart';

// Handlers
export 'src/handlers/comment_sync_handler.dart';
export 'src/handlers/cycle_sync_handler.dart';
export 'src/handlers/entity_sync_handler.dart';
export 'src/handlers/module_sync_handler.dart';
export 'src/handlers/project_sync_handler.dart';
export 'src/handlers/work_item_sync_handler.dart';

// Models
export 'src/models/conflict_result.dart';
export 'src/models/conflict_strategy.dart';
export 'src/models/sync_conflict.dart';
export 'src/models/sync_status.dart';

// Providers
export 'src/providers/sync_providers.dart';

// Widgets
export 'src/widgets/conflict_resolution_sheet.dart';
export 'src/widgets/pending_sync_badge.dart';
export 'src/widgets/sync_status_indicator.dart';

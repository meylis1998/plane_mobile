import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

enum ModuleStatus {
  backlog,
  planned,
  inProgress,
  paused,
  completed,
  cancelled;

  String get label => switch (this) {
        ModuleStatus.backlog => 'Backlog',
        ModuleStatus.planned => 'Planned',
        ModuleStatus.inProgress => 'In Progress',
        ModuleStatus.paused => 'Paused',
        ModuleStatus.completed => 'Completed',
        ModuleStatus.cancelled => 'Cancelled',
      };

  Color get color => switch (this) {
        ModuleStatus.backlog => PlaneColors.grey400,
        ModuleStatus.planned => PlaneColors.info,
        ModuleStatus.inProgress => PlaneColors.warning,
        ModuleStatus.paused => PlaneColors.grey500,
        ModuleStatus.completed => PlaneColors.success,
        ModuleStatus.cancelled => PlaneColors.error,
      };

  IconData get icon => switch (this) {
        ModuleStatus.backlog => Icons.inbox_outlined,
        ModuleStatus.planned => Icons.event_outlined,
        ModuleStatus.inProgress => Icons.play_circle_outline,
        ModuleStatus.paused => Icons.pause_circle_outline,
        ModuleStatus.completed => Icons.check_circle_outline,
        ModuleStatus.cancelled => Icons.cancel_outlined,
      };

  static ModuleStatus? fromString(String? value) {
    if (value == null) return null;
    return switch (value.toLowerCase()) {
      'backlog' => ModuleStatus.backlog,
      'planned' => ModuleStatus.planned,
      'in_progress' || 'inprogress' || 'in progress' => ModuleStatus.inProgress,
      'paused' => ModuleStatus.paused,
      'completed' => ModuleStatus.completed,
      'cancelled' => ModuleStatus.cancelled,
      _ => null,
    };
  }

  String toApiValue() => switch (this) {
        ModuleStatus.backlog => 'backlog',
        ModuleStatus.planned => 'planned',
        ModuleStatus.inProgress => 'in_progress',
        ModuleStatus.paused => 'paused',
        ModuleStatus.completed => 'completed',
        ModuleStatus.cancelled => 'cancelled',
      };
}

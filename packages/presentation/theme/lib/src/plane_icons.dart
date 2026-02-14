import 'package:flutter/material.dart';

/// Commonly used icon constants for the Plane app.
abstract final class PlaneIcons {
  // Navigation
  static const IconData home = Icons.home_outlined;
  static const IconData projects = Icons.folder_outlined;
  static const IconData search = Icons.search;
  static const IconData notifications = Icons.notifications_outlined;
  static const IconData profile = Icons.person_outlined;
  static const IconData settings = Icons.settings_outlined;

  // Work items
  static const IconData workItem = Icons.check_box_outlined;
  static const IconData workItemFilled = Icons.check_box;
  static const IconData subTask = Icons.subdirectory_arrow_right;
  static const IconData attachment = Icons.attach_file;
  static const IconData comment = Icons.chat_bubble_outline;
  static const IconData activity = Icons.history;

  // Project
  static const IconData project = Icons.folder_outlined;
  static const IconData projectFilled = Icons.folder;
  static const IconData members = Icons.people_outlined;
  static const IconData label = Icons.label_outlined;
  static const IconData state = Icons.circle_outlined;

  // Cycles & Modules
  static const IconData cycle = Icons.replay;
  static const IconData module = Icons.view_module_outlined;
  static const IconData page = Icons.description_outlined;

  // Views
  static const IconData listView = Icons.view_list;
  static const IconData kanbanView = Icons.view_kanban;
  static const IconData calendarView = Icons.calendar_today;

  // Priority
  static const IconData priorityUrgent = Icons.error;
  static const IconData priorityHigh = Icons.signal_cellular_alt;
  static const IconData priorityMedium = Icons.signal_cellular_alt_2_bar;
  static const IconData priorityLow = Icons.signal_cellular_alt_1_bar;
  static const IconData priorityNone = Icons.remove;

  // Actions
  static const IconData add = Icons.add;
  static const IconData edit = Icons.edit_outlined;
  static const IconData delete = Icons.delete_outlined;
  static const IconData close = Icons.close;
  static const IconData more = Icons.more_horiz;
  static const IconData filter = Icons.filter_list;
  static const IconData sort = Icons.sort;
  static const IconData copy = Icons.content_copy;
  static const IconData share = Icons.share;
  static const IconData link = Icons.link;
  static const IconData favorite = Icons.star_border;
  static const IconData favoriteFilled = Icons.star;
  static const IconData archive = Icons.archive_outlined;

  // Status
  static const IconData check = Icons.check;
  static const IconData info = Icons.info_outlined;
  static const IconData warning = Icons.warning_amber;
  static const IconData errorIcon = Icons.error_outline;

  // Misc
  static const IconData chevronRight = Icons.chevron_right;
  static const IconData chevronDown = Icons.expand_more;
  static const IconData arrowBack = Icons.arrow_back;
  static const IconData calendar = Icons.calendar_today;
  static const IconData clock = Icons.access_time;
  static const IconData image = Icons.image_outlined;
}

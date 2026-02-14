import 'package:feature_notifications/src/models/notification_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_filter_provider.g.dart';

@riverpod
class CurrentNotificationFilter extends _$CurrentNotificationFilter {
  @override
  NotificationFilter build() => NotificationFilter.all;

  // ignore: use_setters_to_change_properties
  void select(NotificationFilter filter) {
    state = filter;
  }
}

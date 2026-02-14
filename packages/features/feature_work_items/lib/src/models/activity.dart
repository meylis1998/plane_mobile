import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String id,
    required String workItemId,
    required String projectId,
    required String workspaceSlug,
    required String actorId,
    String? field,
    String? oldValue,
    String? newValue,
    String? verb,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

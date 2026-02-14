import 'package:freezed_annotation/freezed_annotation.dart';

part 'workload_item.freezed.dart';
part 'workload_item.g.dart';

@freezed
class WorkloadItem with _$WorkloadItem {
  const factory WorkloadItem({
    required String memberId,
    required String memberName,
    required int assignedCount,
    required int completedCount,
    String? avatar,
  }) = _WorkloadItem;

  factory WorkloadItem.fromJson(Map<String, dynamic> json) =>
      _$WorkloadItemFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'module.freezed.dart';
part 'module.g.dart';

@freezed
class Module with _$Module {
  const factory Module({
    required String id,
    required String projectId,
    required String name,
    String? description,
    String? status,
    DateTime? startDate,
    DateTime? targetDate,
    int? totalIssues,
    int? completedIssues,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}

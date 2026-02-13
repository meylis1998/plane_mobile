import 'package:domain_core/src/entities/label.dart';
import 'package:domain_core/src/entities/work_item_state.dart';
import 'package:domain_core/src/enums/project_network.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

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
    ProjectNetwork? network,
    @Default(false) bool isArchived,
    @Default(false) bool isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WorkItemState>? states,
    List<Label>? labels,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

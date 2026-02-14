import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item_sort.freezed.dart';
part 'work_item_sort.g.dart';

enum SortField {
  createdAt('created_at'),
  updatedAt('updated_at'),
  priority('priority'),
  name('name'),
  sortOrder('sort_order');

  const SortField(this.apiValue);
  final String apiValue;
}

enum SortDirection {
  ascending,
  descending,
}

@freezed
class WorkItemSort with _$WorkItemSort {
  const factory WorkItemSort({
    @Default(SortField.sortOrder) SortField field,
    @Default(SortDirection.ascending) SortDirection direction,
  }) = _WorkItemSort;

  const WorkItemSort._();

  factory WorkItemSort.fromJson(Map<String, dynamic> json) =>
      _$WorkItemSortFromJson(json);

  String toQueryParameter() {
    final prefix = direction == SortDirection.descending ? '-' : '';
    return '$prefix${field.apiValue}';
  }
}

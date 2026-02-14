import 'package:feature_work_items/src/models/work_item_sort.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SortSheet extends StatelessWidget {
  const SortSheet({
    required this.currentSort,
    required this.onApply,
    super.key,
  });

  final WorkItemSort currentSort;
  final void Function(WorkItemSort sort) onApply;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort by', style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),
          ...SortField.values.map((field) {
            final isSelected = currentSort.field == field;
            return ListTile(
              leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected ? PlaneColors.primary : PlaneColors.grey400,
              ),
              title: Text(_labelForField(field)),
              trailing: isSelected
                  ? IconButton(
                      icon: Icon(
                        currentSort.direction == SortDirection.ascending
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 20,
                      ),
                      onPressed: () {
                        final newDirection =
                            currentSort.direction == SortDirection.ascending
                                ? SortDirection.descending
                                : SortDirection.ascending;
                        onApply(currentSort.copyWith(direction: newDirection));
                        Navigator.of(context).pop();
                      },
                    )
                  : null,
              onTap: () {
                onApply(WorkItemSort(field: field));
                Navigator.of(context).pop();
              },
              dense: true,
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  static String _labelForField(SortField field) {
    return switch (field) {
      SortField.createdAt => 'Created date',
      SortField.updatedAt => 'Updated date',
      SortField.priority => 'Priority',
      SortField.name => 'Name',
      SortField.sortOrder => 'Manual',
    };
  }
}

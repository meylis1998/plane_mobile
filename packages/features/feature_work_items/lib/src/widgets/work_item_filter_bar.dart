import 'package:feature_work_items/src/models/work_item_filter.dart';
import 'package:feature_work_items/src/models/work_item_sort.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class WorkItemFilterBar extends StatelessWidget {
  const WorkItemFilterBar({
    required this.filter,
    required this.sort,
    this.onFilterTap,
    this.onSortTap,
    this.onClearFilters,
    super.key,
  });

  final WorkItemFilter filter;
  final WorkItemSort sort;
  final VoidCallback? onFilterTap;
  final VoidCallback? onSortTap;
  final VoidCallback? onClearFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: PlaneColors.dividerLight),
        ),
      ),
      child: Row(
        children: [
          _FilterChip(
            icon: Icons.filter_list_rounded,
            label: 'Filter',
            count: filter.activeCount,
            onTap: onFilterTap,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            icon: Icons.sort_rounded,
            label: 'Sort',
            count: sort.field != SortField.sortOrder ? 1 : 0,
            onTap: onSortTap,
          ),
          if (filter.isNotEmpty) ...[
            const Spacer(),
            TextButton(
              onPressed: onClearFilters,
              child: Text(
                'Clear',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: PlaneColors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.icon,
    required this.label,
    required this.onTap,
    this.count = 0,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActive = count > 0;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? PlaneColors.primarySurface : PlaneColors.grey100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? PlaneColors.primary : PlaneColors.grey200,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? PlaneColors.primary : PlaneColors.grey600,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isActive ? PlaneColors.primary : PlaneColors.grey600,
              ),
            ),
            if (count > 0) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: PlaneColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$count',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: PlaneColors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

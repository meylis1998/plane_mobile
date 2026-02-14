import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class PrioritySelector extends StatelessWidget {
  const PrioritySelector({
    required this.selectedPriority,
    required this.onSelected,
    super.key,
  });

  final Priority selectedPriority;
  final void Function(Priority) onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Select Priority', style: theme.textTheme.titleMedium),
        ),
        const Divider(height: 1),
        ...Priority.values.map((priority) {
          final isSelected = priority == selectedPriority;
          return ListTile(
            leading: PriorityIcon(priority: priority),
            title: Text(PriorityIcon.label(priority)),
            trailing: isSelected
                ? const Icon(Icons.check, color: PlaneColors.primary)
                : null,
            onTap: () {
              onSelected(priority);
              Navigator.of(context).pop();
            },
          );
        }),
        const SizedBox(height: 8),
      ],
    );
  }
}

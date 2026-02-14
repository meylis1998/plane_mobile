import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class StateSelector extends StatelessWidget {
  const StateSelector({
    required this.states,
    required this.selectedStateId,
    required this.onSelected,
    super.key,
  });

  final List<WorkItemState> states;
  final String? selectedStateId;
  final void Function(WorkItemState) onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortedStates = List<WorkItemState>.from(states)
      ..sort((a, b) => a.sequence.compareTo(b.sequence));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Select State', style: theme.textTheme.titleMedium),
        ),
        const Divider(height: 1),
        ...sortedStates.map((s) {
          final isSelected = s.id == selectedStateId;
          return ListTile(
            leading: StateDot(state: s),
            title: Text(s.name),
            trailing: isSelected
                ? const Icon(Icons.check, color: PlaneColors.primary)
                : null,
            onTap: () {
              onSelected(s);
              Navigator.of(context).pop();
            },
          );
        }),
        const SizedBox(height: 8),
      ],
    );
  }
}

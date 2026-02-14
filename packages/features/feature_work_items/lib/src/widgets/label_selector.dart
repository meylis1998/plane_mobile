import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:flutter/material.dart';

class LabelSelector extends StatefulWidget {
  const LabelSelector({
    required this.labels,
    required this.selectedIds,
    required this.onApply,
    super.key,
  });

  final List<Label> labels;
  final List<String> selectedIds;
  final void Function(List<String>) onApply;

  @override
  State<LabelSelector> createState() => _LabelSelectorState();
}

class _LabelSelectorState extends State<LabelSelector> {
  late List<String> _selectedIds;

  @override
  void initState() {
    super.initState();
    _selectedIds = List.from(widget.selectedIds);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Select Labels', style: theme.textTheme.titleMedium),
        ),
        const Divider(height: 1),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.labels.length,
            itemBuilder: (context, index) {
              final label = widget.labels[index];
              final isSelected = _selectedIds.contains(label.id);
              return CheckboxListTile(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedIds.add(label.id);
                    } else {
                      _selectedIds.remove(label.id);
                    }
                  });
                },
                title: Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: StateDot.parseColor(label.color),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(label.name),
                  ],
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                dense: true,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onApply(_selectedIds);
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ),
        ),
      ],
    );
  }
}

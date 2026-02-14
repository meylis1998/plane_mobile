import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ParentIssueSelector extends StatefulWidget {
  const ParentIssueSelector({
    required this.workItems,
    this.currentItemId,
    this.selectedParentId,
    this.projectIdentifier,
    required this.onSelected,
    super.key,
  });

  final List<WorkItem> workItems;
  final String? currentItemId;
  final String? selectedParentId;
  final String? projectIdentifier;
  final void Function(String?) onSelected;

  @override
  State<ParentIssueSelector> createState() => _ParentIssueSelectorState();
}

class _ParentIssueSelectorState extends State<ParentIssueSelector> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Exclude current item from candidates
    final candidates = widget.workItems
        .where((item) => item.id != widget.currentItemId)
        .where((item) =>
            _searchQuery.isEmpty ||
            item.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text('Select Parent', style: theme.textTheme.titleMedium),
                  const Spacer(),
                  if (widget.selectedParentId != null)
                    TextButton(
                      onPressed: () {
                        widget.onSelected(null);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Clear'),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search work items...',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: candidates.length,
                itemBuilder: (context, index) {
                  final item = candidates[index];
                  final isSelected = item.id == widget.selectedParentId;
                  return ListTile(
                    leading: StateDot(state: item.state),
                    title: Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: widget.projectIdentifier != null &&
                            item.sequenceId != null
                        ? Text(
                            '${widget.projectIdentifier}-${item.sequenceId}',
                          )
                        : null,
                    trailing: isSelected
                        ? const Icon(Icons.check, color: PlaneColors.primary)
                        : PriorityIcon(priority: item.priority, size: 14),
                    onTap: () {
                      widget.onSelected(item.id);
                      Navigator.of(context).pop();
                    },
                    dense: true,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:feature_work_items/src/widgets/work_item_kanban_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';

class WorkItemKanbanColumn extends StatelessWidget {
  const WorkItemKanbanColumn({
    required this.state,
    required this.items,
    this.projectIdentifier,
    this.onItemTap,
    this.onAcceptItem,
    this.width = 280,
    super.key,
  });

  final WorkItemState state;
  final List<WorkItem> items;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;
  final void Function(WorkItem item, int index)? onAcceptItem;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RepaintBoundary(
      child: Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: PlaneColors.grey50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Column header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                StateDot(state: state),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    state.name,
                    style: theme.textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: PlaneColors.grey200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${items.length}',
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: PlaneColors.dividerLight),
          // Cards
          Expanded(
            child: DragTarget<WorkItem>(
              onWillAcceptWithDetails: (details) =>
                  details.data.state.id != state.id,
              onAcceptWithDetails: (details) {
                HapticFeedback.lightImpact();
                onAcceptItem?.call(details.data, items.length);
              },
              builder: (context, candidateData, rejectedData) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return LongPressDraggable<WorkItem>(
                      data: item,
                      onDragStarted: HapticFeedback.lightImpact,
                      feedback: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: width - 16,
                          child: WorkItemKanbanCard(
                            workItem: item,
                            projectIdentifier: projectIdentifier,
                          ),
                        ),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.3,
                        child: WorkItemKanbanCard(
                          workItem: item,
                          projectIdentifier: projectIdentifier,
                        ),
                      ),
                      child: WorkItemKanbanCard(
                        workItem: item,
                        projectIdentifier: projectIdentifier,
                        onTap: () => onItemTap?.call(item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      ),
    );
  }
}

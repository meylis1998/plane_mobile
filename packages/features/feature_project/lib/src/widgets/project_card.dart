import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/widgets/identifier_badge.dart';
import 'package:feature_project/src/widgets/network_badge.dart';
import 'package:feature_project/src/widgets/project_emoji.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A card widget that displays a project summary in a list.
class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    this.onTap,
    this.onFavoriteTap,
    super.key,
  });

  final Project project;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: PlaneColors.grey200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              ProjectEmoji(emoji: project.emoji),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (project.identifier != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: IdentifierBadge(
                              identifier: project.identifier!,
                            ),
                          ),
                      ],
                    ),
                    if (project.description != null &&
                        project.description!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        project.description!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: PlaneColors.grey500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        if (project.network != null)
                          NetworkBadge(network: project.network!),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  project.isFavorite ? Icons.star : Icons.star_border,
                  color: project.isFavorite
                      ? PlaneColors.warning
                      : PlaneColors.grey400,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:feature_analytics/feature_analytics.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_cycles/feature_cycles.dart';
import 'package:feature_modules/feature_modules.dart';
import 'package:feature_notifications/feature_notifications.dart';
import 'package:feature_pages/feature_pages.dart';
import 'package:feature_project/feature_project.dart';
import 'package:feature_search/feature_search.dart';
import 'package:feature_work_items/feature_work_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plane_app/screens/profile_screen.dart';
import 'package:plane_app/shell/main_shell.dart';

/// Builds the [GoRouter] for the app.
///
/// Uses [authGuard] from feature_auth to redirect based on
/// authentication and workspace selection state.
GoRouter buildAppRouter(WidgetRef ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: authGuard(ref),
    routes: [
      // Root redirects to /home/projects
      GoRoute(
        path: '/',
        redirect: (_, __) => '/home/projects',
      ),

      // Auth routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/workspace-select',
        builder: (context, state) => const WorkspaceSelectionScreen(),
      ),

      // Main shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          // Projects tab
          GoRoute(
            path: '/home/projects',
            builder: (context, state) {
              final workspace = ref.read(selectedWorkspaceProvider);
              return ProjectListScreen(
                workspaceSlug: workspace?.slug ?? '',
                onProjectTap: (project) {
                  context.go('/home/projects/${project.id}');
                },
                onCreateTap: () {
                  final ws = ref.read(selectedWorkspaceProvider);
                  if (ws != null) {
                    context.push('/home/projects/create');
                  }
                },
              );
            },
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) {
                  final workspace = ref.read(selectedWorkspaceProvider);
                  return ProjectCreateScreen(
                    workspaceSlug: workspace?.slug ?? '',
                    workspaceId: workspace?.id ?? '',
                    onCreated: (project) => context.go(
                      '/home/projects/${project.id}',
                    ),
                  );
                },
              ),
              GoRoute(
                path: ':projectId',
                builder: (context, state) {
                  final projectId = state.pathParameters['projectId']!;
                  final workspace = ref.read(selectedWorkspaceProvider);
                  return ProjectDetailScreen(
                    workspaceSlug: workspace?.slug ?? '',
                    projectId: projectId,
                    onNavigate: (section) {
                      context.go('/home/projects/$projectId/$section');
                    },
                  );
                },
                routes: [
                  GoRoute(
                    path: 'issues',
                    builder: (context, state) {
                      final projectId = state.pathParameters['projectId']!;
                      final workspace = ref.read(selectedWorkspaceProvider);
                      return WorkItemListScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                        onItemTap: (item) {
                          context.go(
                            '/home/projects/$projectId/issues/${item.id}',
                          );
                        },
                        onCreateTap: () {
                          context.push(
                            '/home/projects/$projectId/issues/create',
                          );
                        },
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'create',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return WorkItemCreateScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            onCreated: (item) => context.pop(),
                          );
                        },
                      ),
                      GoRoute(
                        path: ':issueId',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final issueId = state.pathParameters['issueId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return WorkItemDetailScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            workItemId: issueId,
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'settings',
                    builder: (context, state) {
                      final projectId = state.pathParameters['projectId']!;
                      final workspace = ref.read(selectedWorkspaceProvider);
                      return ProjectSettingsScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                        onDeleted: () => context.go('/home/projects'),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'cycles',
                    builder: (context, state) {
                      final projectId =
                          state.pathParameters['projectId']!;
                      final workspace =
                          ref.read(selectedWorkspaceProvider);
                      return CycleListScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                        onCycleTap: (cycle) {
                          context.go(
                            '/home/projects/$projectId/cycles/${cycle.id}',
                          );
                        },
                        onCreateTap: () {
                          context.push(
                            '/home/projects/$projectId/cycles/create',
                          );
                        },
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'create',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return CycleCreateScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            onCreated: (cycle) => context.pop(),
                          );
                        },
                      ),
                      GoRoute(
                        path: ':cycleId',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final cycleId =
                              state.pathParameters['cycleId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return CycleDetailScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            cycleId: cycleId,
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'modules',
                    builder: (context, state) {
                      final projectId =
                          state.pathParameters['projectId']!;
                      final workspace =
                          ref.read(selectedWorkspaceProvider);
                      return ModuleListScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                        onModuleTap: (module) {
                          context.go(
                            '/home/projects/$projectId/modules/${module.id}',
                          );
                        },
                        onCreateTap: () {
                          context.push(
                            '/home/projects/$projectId/modules/create',
                          );
                        },
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'create',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return ModuleCreateScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            onCreated: (module) => context.pop(),
                          );
                        },
                      ),
                      GoRoute(
                        path: ':moduleId',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final moduleId =
                              state.pathParameters['moduleId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return ModuleDetailScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            moduleId: moduleId,
                          );
                        },
                      ),
                    ],
                  ),
                  // Pages routes
                  GoRoute(
                    path: 'pages',
                    builder: (context, state) {
                      final projectId =
                          state.pathParameters['projectId']!;
                      final workspace =
                          ref.read(selectedWorkspaceProvider);
                      return PageListScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                        onPageTap: (page) {
                          context.go(
                            '/home/projects/$projectId/pages/${page.id}',
                          );
                        },
                        onCreateTap: () {
                          context.push(
                            '/home/projects/$projectId/pages/create',
                          );
                        },
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'create',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return PageCreateScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            onCreated: (page) => context.pop(),
                          );
                        },
                      ),
                      GoRoute(
                        path: ':pageId',
                        builder: (context, state) {
                          final projectId =
                              state.pathParameters['projectId']!;
                          final pageId =
                              state.pathParameters['pageId']!;
                          final workspace =
                              ref.read(selectedWorkspaceProvider);
                          return PageDetailScreen(
                            workspaceSlug: workspace?.slug ?? '',
                            projectId: projectId,
                            pageId: pageId,
                          );
                        },
                      ),
                    ],
                  ),
                  // Analytics routes
                  GoRoute(
                    path: 'analytics',
                    builder: (context, state) {
                      final projectId =
                          state.pathParameters['projectId']!;
                      final workspace =
                          ref.read(selectedWorkspaceProvider);
                      return ProjectAnalyticsScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'workload',
                    builder: (context, state) {
                      final projectId =
                          state.pathParameters['projectId']!;
                      final workspace =
                          ref.read(selectedWorkspaceProvider);
                      return WorkloadScreen(
                        workspaceSlug: workspace?.slug ?? '',
                        projectId: projectId,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          // Search tab
          GoRoute(
            path: '/home/search',
            builder: (context, state) {
              final workspace = ref.read(selectedWorkspaceProvider);
              return SearchScreen(
                workspaceSlug: workspace?.slug ?? '',
                onResultTap: (workItem) {
                  context.go(
                    '/home/projects/${workItem.projectId}/issues/${workItem.id}',
                  );
                },
              );
            },
          ),

          // Notifications tab
          GoRoute(
            path: '/home/notifications',
            builder: (context, state) {
              final workspace = ref.read(selectedWorkspaceProvider);
              return NotificationListScreen(
                workspaceSlug: workspace?.slug ?? '',
                onNotificationTap: (notification) {
                  if (notification.entityType == 'issue' &&
                      notification.entityId != null) {
                    // Navigate to the work item detail; entityId
                    // contains projectId:issueId for issue entities.
                    final parts = notification.entityId!.split(':');
                    if (parts.length == 2) {
                      context.go(
                        '/home/projects/${parts[0]}/issues/${parts[1]}',
                      );
                    }
                  }
                },
              );
            },
          ),

          // Profile tab
          GoRoute(
            path: '/home/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}

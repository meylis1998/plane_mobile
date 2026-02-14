import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plane_app/router/app_router.dart';
import 'package:push_notification_service/push_notification_service.dart';
import 'package:theme/theme.dart';

/// The root application widget.
///
/// Wraps [MaterialApp.router] with GoRouter and applies the Plane theme
/// based on the system brightness (light/dark). Also listens for push
/// notification taps and navigates to the appropriate route.
class PlaneApp extends ConsumerStatefulWidget {
  const PlaneApp({super.key});

  @override
  ConsumerState<PlaneApp> createState() => _PlaneAppState();
}

class _PlaneAppState extends ConsumerState<PlaneApp> {
  late final _router = buildAppRouter(ref);
  StreamSubscription<String>? _notificationRouteSubscription;

  @override
  void initState() {
    super.initState();
    _listenForNotificationRoutes();
  }

  void _listenForNotificationRoutes() {
    final pushService = ref.read(pushNotificationServiceProvider);
    _notificationRouteSubscription = pushService.onNotificationRoute.listen(
      (route) {
        _router.go(route);
      },
    );
  }

  @override
  void dispose() {
    _notificationRouteSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Plane',
      debugShowCheckedModeBanner: false,
      theme: PlaneTheme.light(),
      darkTheme: PlaneTheme.dark(),
      routerConfig: _router,
    );
  }
}

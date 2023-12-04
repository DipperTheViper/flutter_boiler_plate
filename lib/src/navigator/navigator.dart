import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

import '../constants/categories/route_category.dart';
export '../constants/categories/route_category.dart';

class AppNavigator {
  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    observers: [
      SentryNavigatorObserver(),
    ],
    debugLogDiagnostics: true,
    navigatorKey: _navigatorKey,
    initialLocation: RouteCategory.splash.path,
    routes: [
      GoRoute(
        parentNavigatorKey: _navigatorKey,
        path: RouteCategory.splash.path,
        name: RouteCategory.splash.name,
        builder: (context, state) => const Scaffold(),
      ),
      GoRoute(
        parentNavigatorKey: _navigatorKey,
        path: RouteCategory.loading.path,
        name: RouteCategory.loading.name,
        builder: (context, state) => const Scaffold(),
      ),
    ],
  );
}

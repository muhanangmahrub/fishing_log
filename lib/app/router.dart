import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/screener/presentation/map_screen.dart';
import '../features/sessions/presentation/session_detail_screen.dart';
import '../features/sessions/presentation/session_form_screen.dart';
import '../features/sessions/presentation/session_list_screen.dart';
import '../features/spots/presentation/spot_list_screen.dart';
import '../features/stats/presentation/stats_screen.dart';
import 'shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

GoRouter buildRouter() => GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const SessionListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/map',
              builder: (context, state) => const MapScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/spots',
              builder: (context, state) => const SpotListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/stats',
              builder: (context, state) => const StatsScreen(),
            ),
          ],
        ),
      ],
    ),
    // Layar sesi dibuka di root navigator: layar penuh, tanpa bottom nav.
    // 'new' harus sebelum ':id' agar tidak dianggap id.
    GoRoute(
      path: '/session/new',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SessionFormScreen(),
    ),
    GoRoute(
      path: '/session/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) =>
          SessionDetailScreen(sessionId: state.pathParameters['id']!),
      routes: [
        GoRoute(
          path: 'edit',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) =>
              SessionFormScreen(sessionId: state.pathParameters['id']),
        ),
      ],
    ),
  ],
);

final routerProvider = Provider<GoRouter>((ref) => buildRouter());

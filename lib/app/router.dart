import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/sessions/presentation/session_detail_screen.dart';
import '../features/sessions/presentation/session_form_screen.dart';
import '../features/sessions/presentation/session_list_screen.dart';

GoRouter buildRouter() => GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SessionListScreen(),
      routes: [
        // 'new' harus sebelum ':id' agar tidak dianggap id.
        GoRoute(
          path: 'session/new',
          builder: (context, state) => const SessionFormScreen(),
        ),
        GoRoute(
          path: 'session/:id',
          builder: (context, state) =>
              SessionDetailScreen(sessionId: state.pathParameters['id']!),
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) =>
                  SessionFormScreen(sessionId: state.pathParameters['id']),
            ),
          ],
        ),
      ],
    ),
  ],
);

final routerProvider = Provider<GoRouter>((ref) => buildRouter());

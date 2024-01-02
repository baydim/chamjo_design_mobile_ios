import 'package:chamjo_design_mobile_ios/app/widgets/app_not_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/detail/detail_view.dart';
import '../modules/home/home_view.dart';
import '../modules/info/info_view.dart';

class AppRoutes {
  static GoRouter route = GoRouter(
    // errorBuilder: (context, state) => const AppNotFound(),
    onException: (context, state, router) => router.go('/404'),
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details/:id',
            builder: (BuildContext context, GoRouterState state) {
              final id = state.pathParameters['id'];
              return DetailView(
                id: id ?? "",
              );
            },
          ),
          GoRoute(
            path: 'info',
            builder: (BuildContext context, GoRouterState state) {
              return const InfoView();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/:name',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/details/:id',
        builder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['id'];
          return DetailView(
            id: id ?? "",
          );
        },
      ),
      GoRoute(
        path: '/404',
        builder: (BuildContext context, GoRouterState state) {
          return const AppNotFound();
        },
      ),
      // GoRoute(
      //   path: '/sp',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SplashView();
      //   },
      // ),
    ],
  );
}

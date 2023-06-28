import 'package:finder/ui/bachelor/bachelorDetails.dart';
import 'package:finder/ui/bachelor/bachelorFavorites.dart';
import 'package:finder/ui/bachelors/bachelorsMaster.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BachelorsMaster();
      },
    ),
    GoRoute(
      path: '/favorites',
      builder: (BuildContext context, GoRouterState state) {
        return const BachelorFavorites();
      },
    ),
    GoRoute(
      path: '/bachelor/:id',
      builder: (BuildContext context, GoRouterState state) {
        if (state.pathParameters['id'] == null) {
          return const CupertinoPageScaffold(
            child: Center(
              child: Text('Invalid ID'),
            ),
          );
        }
        return BachelorDetails(bachelorId: state.pathParameters['id'] as String);
      },
    ),
  ],
);
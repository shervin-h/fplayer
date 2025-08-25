import 'package:flutter/material.dart';
import 'package:fplayer/src/core/extensions/string_extensions.dart';
import 'package:fplayer/src/features/file_explorer/presentation/widgets/explorer_section.dart';
import 'package:fplayer/src/features/file_explorer/presentation/screens/explorer_screen.dart';
import 'package:fplayer/src/features/player/presentation/screens/player_screen.dart';
import 'package:fplayer/src/routing/app_route_name.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRouteName.main,
      builder: (BuildContext context, GoRouterState state) {
        return const ExplorerScreen();
      },
    ),
    GoRoute(
      path: AppRouteName.player.asPath(),
      name: AppRouteName.player,
      builder: (BuildContext context, GoRouterState state) {
        return const PlayerScreen();
      },
    ),
  ],
);

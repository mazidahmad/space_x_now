import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_now_app/features/main/main_page.dart';
import 'package:space_x_now_app/features/rockets/presentations/pages/rocket_detail_page.dart';
import 'package:space_x_now_app/features/startup/presentation/pages/startup_page.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

import '../features/favorites/presentation/pages/favorites_page.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        page: StartupRoute.page,
        path: StartupPage.routeName,
      ),
      AutoRoute(
        page: MainRoute.page,
        path: MainPage.routeName,
      ),
      AutoRoute(
        page: RocketDetailRoute.page,
        path: RocketDetailPage.routeName,
      ),
      AutoRoute(
        page: FavoritesRoute.page,
        path: FavoritesPage.routeName,
      ),
    ];
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      getIt<GlobalService>().globalNavKey;
}

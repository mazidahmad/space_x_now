import 'package:auto_route/auto_route.dart';
import 'package:space_x_now_app/features/startup/presentation/pages/startup_page.dart';

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
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import 'flavors.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        title: F.title,
        theme: AppTheme.darkTheme,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

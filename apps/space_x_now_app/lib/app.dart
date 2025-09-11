import 'package:flutter/material.dart';
import 'package:space_x_now_app/features/main/cubit/app_config/app_config_cubit.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import 'flavors.dart';
import 'l10n/app_localizations.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppConfigCubit>()..init(),
      child: ToastificationWrapper(
        child: BlocBuilder<AppConfigCubit, AppConfigState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: F.title,
              locale: Locale(state.locale),
              theme: AppTheme.main(),
              routerConfig: _appRouter.config(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}

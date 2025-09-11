import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_now_app/router/app_router.gr.dart';
import 'package:space_x_now_core/core.dart' show BlocProvider, BlocListener;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import '../cubit/startup_cubit.dart';

@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  static const String routeName = '/';

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> with MessengerMixin {
  late final StartupCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<StartupCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit..initializeApp(),
        child: BlocListener<StartupCubit, StartupState>(
          listener: (context, state) {
            if (state.status == StartupStatus.success) {
              context.router.push(MainRoute());
            } else if (state.status == StartupStatus.failure) {
              // Show error message
              final failureMessage = state.failure?.message ?? 'Unknown error';
              showAppToast(
                title: failureMessage,
                type: ToastType.failed,
              );
            }
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'app_logo',
                  child: AppImage.asset(
                    AppImages.imgAppLogo,
                    width: 100,
                    height: 100,
                    borderRadius: 14,
                  ),
                ),
                Text(
                  'N  O  W',
                  style: AppTextStyle.headline3(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

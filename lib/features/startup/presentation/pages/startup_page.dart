import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/mixin/messenger_mixin.dart';
import '../cubit/startup_cubit.dart';

@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  static const String routeName = '/';

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> with MessengerMixin {
  final StartupCubit _cubit = getIt<StartupCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit..initializeApp(),
        child: BlocListener<StartupCubit, StartupState>(
          listener: (context, state) {
            if (state.status == StartupStatus.success) {
              // Navigate to the next page or home page
              // For example:
              // context.router.replace(const HomeRoute());
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
            child: Text(
              'Startup Page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}

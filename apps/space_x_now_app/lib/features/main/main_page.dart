import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_now_app/core/utils/localization_util.dart';
import 'package:space_x_now_core/core.dart' show BlocProvider, BlocBuilder;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import 'cubit/app_config/app_config_cubit.dart';
import 'cubit/main/main_cubit.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final MainCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<MainCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<AppConfigCubit, AppConfigState>(
        builder: (context, state) {
          return BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: AppBottomNavigationBar(
                  currentIndex: state.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '${LocalizationUtil.localization?.home}',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.rocket_launch),
                      label: '${LocalizationUtil.localization?.rockets}',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: '${LocalizationUtil.localization?.settings}',
                    ),
                  ],
                  onTap: _cubit.onPageChanged,
                ),
                body: PageView.builder(
                  controller: _cubit.pageController,
                  itemCount: _cubit.pages.length,
                  itemBuilder: (context, index) {
                    return _cubit.pages[index];
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

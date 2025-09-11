import 'package:flutter/material.dart';
import 'package:space_x_now_app/features/home/presentations/pages/home_pager.dart';
import 'package:space_x_now_app/features/rockets/presentations/pages/rockets_pager.dart';
import 'package:space_x_now_app/features/settings/presentation/pages/settings_pager.dart';
import 'package:space_x_now_core/core.dart';
import 'package:space_x_now_di/di.dart';

part 'main_state.dart';

@Injectable()
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(currentIndex: 0));

  final PageController pageController = PageController();
  final List<Widget> pages = const [
    HomePager(),
    RocketsPager(),
    SettingsPager(),
  ];

  void onPageChanged(int index) {
    emit(state.copyWith(currentIndex: index));
    pageController.jumpToPage(index);
  }
}

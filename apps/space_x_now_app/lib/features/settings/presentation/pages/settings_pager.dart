import 'package:flutter/material.dart';
import 'package:space_x_now_core/core.dart' show BlocProvider, BlocBuilder;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import '../../../../core/utils/localization_util.dart';
import '../../../rockets/presentations/pages/rockets_pager.dart';
import '../cubit/settings_cubit.dart';

class SettingsPager extends StatefulWidget {
  const SettingsPager({super.key});

  @override
  State<SettingsPager> createState() => _SettingsPagerState();
}

class _SettingsPagerState extends State<SettingsPager> with BottomsheetMixin {
  late final SettingsCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<SettingsCubit>();
    setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '${LocalizationUtil.localization?.settings}',
            style: AppTextStyle.headline4(),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            ListTile(
              title: Text(
                '${LocalizationUtil.localization?.language}',
                style: AppTextStyle.headline5(),
              ),
              subtitle: Text(
                '${LocalizationUtil.localization?.selectYourPreferredLanguage}',
                style: AppTextStyle.body12(),
              ),
              onTap: () {
                showAppBottomSheet(
                  title: '${LocalizationUtil.localization?.language}',
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<SettingsCubit, SettingsState>(
                        bloc: _cubit,
                        builder: (context, state) {
                          return Column(
                            children: [
                              FilterRadioItem(
                                label: 'English',
                                isSelected: state.locale == 'en',
                                onTap: () {
                                  _cubit.changeLanguage('en');
                                },
                              ),
                              FilterRadioItem(
                                label: 'Bahasa Indonesia',
                                isSelected: state.locale == 'id',
                                onTap: () {
                                  _cubit.changeLanguage('id');
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            // Add more settings options here
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:space_x_now_app/core/utils/localization_util.dart';
import 'package:space_x_now_core/core.dart' show BlocBuilder, BlocProvider;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import '../cubit/recent/recent_launches_cubit.dart';

class HomePager extends StatefulWidget {
  const HomePager({super.key});

  @override
  State<HomePager> createState() => _HomePagerState();
}

class _HomePagerState extends State<HomePager> {
  late final RecentLaunchesCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<RecentLaunchesCubit>();
    _cubit.scrollController.addListener(() {
      if (_cubit.scrollController.position.pixels >=
          _cubit.scrollController.position.maxScrollExtent - 200) {
        _cubit.fetchMoreLaunches();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..fetchLaunches(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Hero(
                      tag: 'app_logo',
                      child: AppImage.asset(
                        AppImages.imgAppLogo,
                        width: 40,
                        height: 40,
                        borderRadius: 8,
                      ),
                    ),
                    Gap(12),
                    Text(
                      'N O W',
                      style: AppTextStyle.headline3(),
                    )
                  ],
                ),
                Gap(20),
                Text('Recent Launches', style: AppTextStyle.headline4()),
                Gap(12),
                BlocBuilder<RecentLaunchesCubit, RecentLaunchesState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case RecentLaunchesStatus.initial:
                      case RecentLaunchesStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case RecentLaunchesStatus.more:
                      case RecentLaunchesStatus.loaded:
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              _cubit.fetchLaunches();
                            },
                            child: ListView.separated(
                              controller: _cubit.scrollController,
                              separatorBuilder: (context, index) =>
                                  const Gap(12),
                              itemBuilder: (context, index) {
                                final launch = state.launches[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.dark1,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      AppImage.network(
                                        launch.links.patch?.small ??
                                            'https://via.placeholder.com/100',
                                        width: 100,
                                        height: 100,
                                        borderRadius: 16,
                                      ),
                                      Gap(12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppSmallTextItem(
                                              label:
                                                  '${LocalizationUtil.localization?.name}',
                                              value: launch.name,
                                            ),
                                            Gap(8),
                                            AppSmallTextItem(
                                              label:
                                                  '${LocalizationUtil.localization?.homeUpcomingCardLabelFlightNumber}',
                                              value: launch.flightNumber
                                                  .toString(),
                                            ),
                                            Gap(8),
                                            Text(
                                              launch.parsedDate,
                                              style: AppTextStyle.body14(
                                                  color: AppColors.dark3),
                                            ),
                                            if (launch.launchpad != null) ...[
                                              Gap(8),
                                              AppSmallTextItem(
                                                label:
                                                    '${LocalizationUtil.localization?.homeUpcomingCardLabelLaunchpad}',
                                                value: launch.launchpad!.name,
                                              ),
                                              if (launch.rocket != null) Gap(8),
                                              AppSmallTextItem(
                                                label:
                                                    '${LocalizationUtil.localization?.rockets}',
                                                value: launch.rocket!.name,
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: state.launches.length,
                            ),
                          ),
                        );
                      default:
                        return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

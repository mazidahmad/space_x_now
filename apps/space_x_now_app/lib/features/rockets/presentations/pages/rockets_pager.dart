import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_now_app/core/utils/localization_util.dart';
import 'package:space_x_now_app/router/app_router.gr.dart';
import 'package:space_x_now_core/core.dart' show BlocBuilder, BlocProvider;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import '../cubit/rockets/rockets_cubit.dart';

class RocketsPager extends StatefulWidget {
  const RocketsPager({super.key});

  static const String routeName = '/rockets';

  @override
  State<RocketsPager> createState() => _RocketsPagerState();
}

class _RocketsPagerState extends State<RocketsPager> with BottomsheetMixin {
  late final RocketsCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<RocketsCubit>();
    setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..initialize(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: AppSearchTextField(
                    searchText: '${LocalizationUtil.localization?.search}',
                    onChanged: (value) {
                      _cubit.searchRockets(value);
                    },
                  )),
                  IconButton(
                    onPressed: () {
                      showAppBottomSheet(
                        title:
                            '${LocalizationUtil.localization?.filterRockets}',
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${LocalizationUtil.localization?.status}',
                              style: AppTextStyle.headline6(),
                            ),
                            Gap(12),
                            BlocBuilder<RocketsCubit, RocketsState>(
                              bloc: _cubit,
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    FilterRadioItem(
                                      label:
                                          '${LocalizationUtil.localization?.allStatus}',
                                      isSelected: state.isActive == null,
                                      onTap: () {
                                        _cubit.filterRockets(RocketsFilter.all);
                                      },
                                    ),
                                    FilterRadioItem(
                                      label:
                                          '${LocalizationUtil.localization?.active}',
                                      isSelected: state.isActive == true,
                                      onTap: () {
                                        _cubit.filterRockets(
                                            RocketsFilter.active);
                                      },
                                    ),
                                    FilterRadioItem(
                                      label:
                                          '${LocalizationUtil.localization?.inactive}',
                                      isSelected: state.isActive == false,
                                      onTap: () {
                                        _cubit.filterRockets(
                                            RocketsFilter.inactive);
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
                    icon: Icon(
                      Icons.filter_list,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.push(const FavoritesRoute());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.red1,
                      ),
                    ),
                  ),
                  Gap(20),
                ],
              ),
              Gap(12),
              BlocBuilder<RocketsCubit, RocketsState>(
                  builder: (context, state) {
                switch (state.status) {
                  case RocketsStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case RocketsStatus.success:
                  case RocketsStatus.more:
                    if (state.rockets.isEmpty) {
                      return const Center(child: Text('No rockets found'));
                    }
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        itemBuilder: (context, index) {
                          final rocket = state.rockets[index];
                          return GestureDetector(
                            onTap: () {
                              context
                                  .pushRoute(RocketDetailRoute(rocket: rocket));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.dark1,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Hero(
                                    tag: rocket.id,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(16),
                                      child: AppImage.network(
                                        rocket.flickrImages.isNotEmpty
                                            ? rocket.flickrImages.first
                                            : 'https://via.placeholder.com/150',
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(alpha: 0.7),
                                          ],
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            rocket.name,
                                            style: AppTextStyle.headline5(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: state.rockets.length,
                      ),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class FilterRadioItem extends StatelessWidget {
  const FilterRadioItem({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyle.body16(),
            ),
            Spacer(),
            Icon(isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked)
          ],
        ),
      ),
    );
  }
}

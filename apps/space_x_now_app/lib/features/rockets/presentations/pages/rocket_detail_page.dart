import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_now_app/core/utils/localization_util.dart';
import 'package:space_x_now_core/core.dart' show BlocProvider, BlocBuilder;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';
import 'package:space_x_rockets/rockets.dart';

import '../cubit/rocket_detail/rocket_detail_cubit.dart';

@RoutePage()
class RocketDetailPage extends StatefulWidget {
  const RocketDetailPage({super.key, required this.rocket});

  static const String routeName = '/rockets/:id';

  final Rocket rocket;

  @override
  State<RocketDetailPage> createState() => _RocketDetailPageState();
}

class _RocketDetailPageState extends State<RocketDetailPage>
    with TickerProviderStateMixin {
  late final Rocket rocket;
  late final TabController _tabController;
  late final PageController _pageController;
  Timer? _timer;

  late final RocketDetailCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<RocketDetailCubit>();
    rocket = widget.rocket;
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextPage = _pageController.page!.toInt() + 1;
        if (nextPage < rocket.flickrImages.length) {
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
          );
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..checkIfRocketIsFavorited(rocket.id),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: rocket.id,
                  child: rocket.flickrImages.isNotEmpty
                      ? PageView.builder(
                          controller: _pageController,
                          itemCount: rocket.flickrImages.length,
                          itemBuilder: (context, index) {
                            return AppImage.network(
                              rocket.flickrImages[index],
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: double.infinity,
                            );
                          },
                        )
                      : AppImage.network(
                          'https://via.placeholder.com/300x200.png?text=No+Image',
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: double.infinity,
                        ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<RocketDetailCubit, RocketDetailState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.dark1,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                rocket.name,
                                style: AppTextStyle.headline2(),
                              ),
                            ),
                            Gap(20),
                            AppCircularIconButton(
                              icon: state.isFavorited
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              iconColor: state.isFavorited
                                  ? AppColors.red1
                                  : AppColors.dark2,
                              size: 24,
                              onTap: () => _cubit.toggleFavoriteStatus(rocket),
                            ),
                          ],
                        ),
                        Gap(12),
                        AppSmallTextItem(
                          label:
                              '${LocalizationUtil.localization?.description}',
                          value: rocket.description,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${LocalizationUtil.localization?.specs}',
                          style: AppTextStyle.smallLabel(),
                        ),
                        Column(
                          children: [
                            TabBar(
                              controller: _tabController,
                              tabs: [
                                Tab(
                                    text:
                                        '${LocalizationUtil.localization?.general}'),
                                Tab(
                                    text:
                                        '${LocalizationUtil.localization?.propulsion}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            AspectRatio(
                              aspectRatio: 1,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  GeneralSpecDetail(rocket: rocket),
                                  PropulsionSpecDetail(rocket: rocket),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GeneralSpecDetail extends StatelessWidget {
  const GeneralSpecDetail({super.key, required this.rocket});

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.name}',
                value: rocket.name,
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.status}',
                value: rocket.isActive
                    ? '${LocalizationUtil.localization?.active}'
                    : '${LocalizationUtil.localization?.inactive}',
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.country}',
                value: rocket.country,
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.height}',
                value: rocket.height.meters.toString(),
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.launchCost}',
                value: rocket.costPerLaunch.toString(),
              ),
            ],
          ),
        ),
        Gap(8),
        Expanded(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.stages}',
                value: rocket.stages.toString(),
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.mass}',
                value: '${rocket.mass.kg} kg / ${rocket.mass.lb} lb',
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.firstFlight}',
                value: rocket.firstFlight,
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.sideBoosters}',
                value: rocket.boosters.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PropulsionSpecDetail extends StatelessWidget {
  const PropulsionSpecDetail({super.key, required this.rocket});

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.engineType}',
                value: rocket.engines.type,
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.seaLevelThrust}',
                value: rocket.engines.thrustSeaLevel.kN.toString(),
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.propellant1}',
                value: rocket.engines.propellant1,
              ),
              AppSmallTextItem(
                  label: '${LocalizationUtil.localization?.engineCount}',
                  value: rocket.engines.number.toString()),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.vacuumThrust}',
                value: rocket.engines.thrustVacuum.kN.toString(),
              ),
            ],
          ),
        ),
        Gap(8),
        Expanded(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.propellant2}',
                value: rocket.engines.propellant2,
              ),
              AppSmallTextItem(
                label: 'TWR',
                value: '${rocket.engines.thrustSeaLevel.kN / rocket.mass.kg}',
              ),
              AppSmallTextItem(
                label: 'ISP (SEA/VACUUM)',
                value:
                    '${rocket.engines.isp.seaLevel} / ${rocket.engines.isp.vacuum}',
              ),
              AppSmallTextItem(
                label: '${LocalizationUtil.localization?.maxEngineLoss}',
                value: rocket.engines.engineLossMax.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

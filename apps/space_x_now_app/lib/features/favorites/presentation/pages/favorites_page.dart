import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x_now_core/core.dart' show BlocProvider, BlocBuilder;
import 'package:space_x_now_di/di.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

import '../../../../router/app_router.gr.dart';
import '../cubit/cubit/favorites_cubit.dart';

@RoutePage()
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const String routeName = '/favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final FavoritesCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<FavoritesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..initialize(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorites',
            style: AppTextStyle.headline4(),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              switch (state.status) {
                case FavoritesStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case FavoritesStatus.loaded:
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
                          onTap: () async {
                            await context
                                .pushRoute(RocketDetailRoute(rocket: rocket));
                            _cubit.initialize();
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
            },
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

enum AppImageType { asset, network }

class AppImage extends StatelessWidget {
  const AppImage(
    this.path, {
    super.key,
    this.boxFit,
    this.width,
    this.height,
    this.type = AppImageType.network,
    this.isSvg = false,
    this.borderRadius = 0,
  });

  final String path;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  final AppImageType type;
  final bool isSvg;
  final double borderRadius;

  factory AppImage.asset(
    String path, {
    BoxFit? boxFit,
    double? width,
    double? height,
    double borderRadius = 0,
  }) =>
      AppImage(
        path,
        boxFit: boxFit,
        width: width,
        height: height,
        type: AppImageType.asset,
        isSvg: path.contains('.svg'),
        borderRadius: borderRadius,
      );

  factory AppImage.network(
    String path, {
    BoxFit? boxFit,
    double? width,
    double? height,
    double borderRadius = 0,
  }) =>
      AppImage(
        path,
        boxFit: boxFit,
        width: width,
        height: height,
        type: AppImageType.network,
        isSvg: path.contains('.svg'),
        borderRadius: borderRadius,
      );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: type == AppImageType.asset
          ? isSvg
              ? SvgPicture.asset(
                  path,
                  width: width,
                  height: height,
                  fit: boxFit ?? BoxFit.contain,
                  placeholderBuilder: (context) => AppImagePlaceHolder(
                    width: width,
                    height: height,
                  ),
                )
              : Image.asset(
                  path,
                  width: width,
                  height: height,
                  fit: boxFit ?? BoxFit.contain,
                  package: 'space_x_now_ui_components',
                )
          : CachedNetworkImage(
              imageUrl: path,
              width: width,
              height: height,
              fit: boxFit ?? BoxFit.cover,
              placeholder: (context, url) => AppShimmerPrimary(
                width: width,
                height: height,
                borderRadius: BorderRadius.circular(8),
              ),
              errorWidget: (context, url, error) => AppImagePlaceHolder(
                width: width,
                height: height,
              ),
            ),
    );
  }
}

class AppImagePlaceHolder extends StatelessWidget {
  const AppImagePlaceHolder({
    super.key,
    required this.width,
    required this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppColors.backgroundSecondary,
      child: const Center(
        child: Icon(
          FontAwesomeIcons.image,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../ui_components.dart';

class AppShimmerPrimary extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  const AppShimmerPrimary(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.borderRadius,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: AppColors.light4.withValues(alpha: 0.25),
        highlightColor: AppColors.light0,
        child: child ??
            Container(
              width: width ?? double.infinity,
              height: height ?? 49,
              decoration: BoxDecoration(
                color: AppColors.light4.withValues(alpha: 0.25),
                border: Border.all(
                  color: AppColors.light4.withValues(alpha: 0.25),
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(6),
              ),
            ),
      ),
    );
  }
}

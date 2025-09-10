import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  // ==================== BASE PRIMARY ====================

  static TextStyle _basePrimary({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double letterSpacing = 0.0,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      TextStyle(
        fontFamily: 'D-DIN',
        color: color ?? AppColors.mainText,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        locale: const Locale('en', 'EN'),
        textBaseline: TextBaseline.alphabetic,
        decorationColor: color,
      );

  /// Large title for mission names
  static TextStyle get missionTitle => _basePrimary(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.isDarkTheme
            ? AppColors.pureWhite
            : AppColors.spaceDeepBlue,
        letterSpacing: 0.5,
      );

  /// Subtitle for rocket names
  static TextStyle get rocketName => _basePrimary(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.rocketOrange,
      );

  /// Launch date styling
  static TextStyle get launchDate => _basePrimary(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.isDarkTheme
            ? AppColors.metallicBright
            : AppColors.metallicMid,
      );

  /// Mission description
  static TextStyle get missionDescription => _basePrimary(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.isDarkTheme
            ? AppColors.metallicBright
            : AppColors.metallicMid,
        height: 1.5,
      );

  /// Status badge text
  static TextStyle get statusBadge => _basePrimary(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.pureWhite,
        letterSpacing: 0.5,
      );

  /// Counter text for countdown
  static TextStyle get countdownText => _basePrimary(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.rocketOrange,
        letterSpacing: 2,
      );
}

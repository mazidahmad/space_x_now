import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double letterSpacing = 0.0,
    double? height,
    TextDecoration? decoration,
  }) =>
      GoogleFonts.inter(
        color: color,
        decoration: decoration,
        fontSize: fontSize * 1,
        fontWeight: fontWeight,
        height: height != null ? height * 1 : null,
        letterSpacing: letterSpacing * 1,
        locale: const Locale('en', 'EN'),
        textBaseline: TextBaseline.alphabetic,
      );

  static TextTheme mainTextTheme = TextTheme(
    bodyLarge: body18(),
    bodyMedium: body16(),
    bodySmall: body14(),
    displayLarge: display1(),
    displayMedium: display2(),
    displaySmall: headline1(),
    headlineMedium: headline2(),
    headlineSmall: headline3(),
    labelLarge: largeLabel(),
    labelMedium: mediumLabel(),
    labelSmall: smallLabel(),
    titleLarge: headline4(),
    titleMedium: headline5(),
    titleSmall: small(),
  );

  static TextStyle blockquote({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
      );

  static TextStyle body11({
    Color color = AppColors.textPrimary,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        color: color,
        fontSize: 11,
        fontWeight: fontWeight,
        height: 1.2,
      );

  static TextStyle body12({
    Color color = AppColors.textPrimary,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration? decoration,
  }) =>
      _base(
        color: color,
        fontSize: 12,
        fontWeight: fontWeight,
        height: 1.2,
        decoration: decoration,
      );

  static TextStyle body14({
    Color color = AppColors.textPrimary,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      _base(
        color: color,
        decoration: decoration,
        fontSize: 14,
        fontWeight: fontWeight,
        // height: 1.4,
        letterSpacing: -0.006 * 14,
      );

  static TextStyle body16({
    Color color = AppColors.textPrimary,
    TextDecoration decoration = TextDecoration.none,
    double height = 24 / 16,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      _base(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: -0.011 * 16,
        decoration: decoration,
      );

  static TextStyle body18({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 24 / 18,
        letterSpacing: -0.014 * 18,
      );

  static TextStyle capitalized({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 16.94 / 14,
        letterSpacing: 2,
      );

  static TextStyle display1({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 56,
        fontWeight: FontWeight.w700,
        height: 67.77 / 56,
      );

  static TextStyle display2({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 40,
        fontWeight: FontWeight.w400,
        height: 48.41 / 40,
        letterSpacing: -0.022 * 40,
      );

  static TextStyle headline1({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 44 / 32,
        letterSpacing: -0.021 * 32,
      );

  static TextStyle headline2({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 38 / 28,
        letterSpacing: -0.018 * 28,
      );

  static TextStyle headline3({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
        letterSpacing: -0.019 * 24,
      );

  static TextStyle headline4({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 28 / 20,
        letterSpacing: -0.017 * 20,
      );

  static TextStyle headline5({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 26 / 18,
        letterSpacing: -0.014 * 18,
      );

  static TextStyle headline6({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 22 / 16,
        letterSpacing: -0.011 * 16,
      );

  static TextStyle headline7({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 20 / 14,
        letterSpacing: -0.011 * 14,
      );

  static TextStyle headline8({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 18 / 12,
        letterSpacing: -0.011 * 12,
      );

  static TextStyle lead({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 24 / 14,
        letterSpacing: -0.006 * 14,
      );

  static TextStyle largeLabel({
    Color color = AppColors.primaryColor,
  }) =>
      _base(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
      );

  static TextStyle mediumLabel({
    Color color = AppColors.primaryColor,
    double height = 14 / 14,
  }) =>
      _base(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: height,
      );

  static TextStyle small({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
      );

  static TextStyle smallLabel({
    Color color = AppColors.primaryColor,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      _base(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          decoration: decoration);

  static TextStyle tiny({
    Color color = AppColors.textPrimary,
  }) =>
      _base(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.w600,
          height: 12.1 / 10,
          letterSpacing: 0.01 * 10);
}

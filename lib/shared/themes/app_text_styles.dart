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

  // ==================== DISPLAY ====================

  // LARGE

  static TextStyle pDisplayLgRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 40 / 32,
      );

  static TextStyle pDisplayLgMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w500,
        height: 40 / 32,
      );

  static TextStyle pDisplayLgSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 40 / 32,
      );

  static TextStyle pDisplayLgBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
      );

  // MEDIUM

  static TextStyle pDisplayMdRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 36 / 28,
      );

  static TextStyle pDisplayMdMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        height: 36 / 28,
      );

  static TextStyle pDisplayMdSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36 / 28,
      );

  static TextStyle pDisplayMdBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 36 / 28,
      );

  // SMALL

  static TextStyle pDisplaySmRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
      );

  static TextStyle pDisplaySmMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 32 / 24,
      );

  static TextStyle pDisplaySmSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
      );

  static TextStyle pDisplaySmBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
      );

  // EXTRA SMALL

  static TextStyle pDisplayXsRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 28 / 20,
      );

  static TextStyle pDisplayXsMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 28 / 20,
      );

  static TextStyle pDisplayXsSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
      );

  static TextStyle pDisplayXsBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 28 / 20,
      );

  // ==================== TEXT ====================

  // LARGE

  static TextStyle pTextLgRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 28 / 18,
      );

  static TextStyle pTextLgMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 28 / 18,
      );

  static TextStyle pTextLgSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 28 / 18,
      );

  static TextStyle pTextLgBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 28 / 18,
      );

  // MEDIUM

  static TextStyle pTextMdRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 26 / 16,
      );

  static TextStyle pTextMdMedium({
    Color? color,
    TextDecoration? decoration,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 26 / 16,
        decoration: decoration,
      );

  static TextStyle pTextMdSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 26 / 16,
      );

  static TextStyle pTextMdBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 26 / 16,
      );

  // MEDIUM ITALIC

  static TextStyle pTextMdItalicRegular({
    Color? color,
  }) =>
      _basePrimary(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 26 / 16,
          fontStyle: FontStyle.italic);

  static TextStyle pTextMdItalicMedium({
    Color? color,
  }) =>
      _basePrimary(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 26 / 16,
          fontStyle: FontStyle.italic);

  static TextStyle pTextMdItalicSemiBold({
    Color? color,
  }) =>
      _basePrimary(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 26 / 16,
          fontStyle: FontStyle.italic);

  static TextStyle pTextMdItalicBold({
    Color? color,
  }) =>
      _basePrimary(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 26 / 16,
          fontStyle: FontStyle.italic);

  // SMALL

  static TextStyle pTextSmRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 22 / 14,
      );

  static TextStyle pTextSmMedium({
    Color? color,
    TextDecoration? decoration,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 22 / 14,
        decoration: decoration,
      );

  static TextStyle pTextSmSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 22 / 14,
      );

  static TextStyle pTextSmBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 22 / 14,
      );

  // SMALL ITALIC

  static TextStyle pTextSmItalicRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 22 / 14,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pTextSmItalicMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 22 / 14,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pTextSmItalicSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 22 / 14,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pTextSmItalicBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 22 / 14,
        fontStyle: FontStyle.italic,
      );

  // ==================== MACRO ====================

  // MACRO

  static TextStyle pMacroRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 18 / 12,
      );

  static TextStyle pMacroMedium({
    Color? color,
    TextDecoration? decoration,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 18 / 12,
        decoration: decoration,
      );

  static TextStyle pMacroSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 18 / 12,
      );

  static TextStyle pMacroBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 18 / 12,
      );

  // MACRO ITALIC

  static TextStyle pMacroItalicRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 18 / 12,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pMacroItalicMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 18 / 12,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pMacroItalicSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 18 / 12,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pMacroItalicBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 18 / 12,
        fontStyle: FontStyle.italic,
      );

  // MACRO SMALL

  static TextStyle pMacroSmRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 16 / 11,
      );

  static TextStyle pMacroSmMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
      );

  static TextStyle pMacroSmSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 16 / 11,
      );

  static TextStyle pMacroSmBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        height: 16 / 11,
      );

  // MACRO SMALL ITALIC

  static TextStyle pMacroSmItalicRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 16 / 11,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pMacroSmItalicMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pMacroSmItalicSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 16 / 11,
        fontStyle: FontStyle.italic,
      );

  static TextStyle pMacroSmItalicBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        height: 16 / 11,
        fontStyle: FontStyle.italic,
      );

  // ==================== CAPTION ====================

  // CAPTION SMALL

  static TextStyle pCaptionSmRegular({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 166 / 8,
      );

  static TextStyle pCaptionSmMedium({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 8,
        fontWeight: FontWeight.w500,
        height: 166 / 8,
      );

  static TextStyle pCaptionSmSemiBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 8,
        fontWeight: FontWeight.w600,
        height: 166 / 8,
      );

  static TextStyle pCaptionSmBold({
    Color? color,
  }) =>
      _basePrimary(
        color: color,
        fontSize: 8,
        fontWeight: FontWeight.w700,
        height: 166 / 8,
      );
}

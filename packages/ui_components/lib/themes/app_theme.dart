import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui_components.dart';

class AppTheme {
  static ThemeData main() => ThemeData(
        colorScheme:
            const ColorScheme.dark(surface: AppColors.backgroundDefault),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
        //------------- App Colors -------------//
        primarySwatch: AppColors.primarySwatch,

        primaryColor: AppColors.primaryColor,
        dividerColor: Colors.transparent,
        hoverColor: Colors.white,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDefault,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        //------------- App Bar -------------//
        appBarTheme: AppBarTheme(
          surfaceTintColor: AppColors.dark0,
          foregroundColor: AppColors.textPrimary,
          backgroundColor: AppColors.dark0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          elevation: 0,
          shadowColor: AppColors.shadow,
          iconTheme: const IconThemeData(
            color: AppColors.light4,
            opacity: 1,
            size: 20,
          ),
        ),

        //------------- Font -------------//
        textTheme: AppTextStyle.mainTextTheme,

        //------------- Text Selection -------------//
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor.withValues(alpha: 0.6),
          selectionColor: AppColors.primaryColor.withValues(alpha: 0.5),
          selectionHandleColor: AppColors.primaryColor.withValues(alpha: 01),
        ),

        //------------- Elevated Button -------------//
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),

        //------------- Tab Bar -------------//
        tabBarTheme: TabBarThemeData(
          labelStyle: AppTextStyle.body16(fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppTextStyle.body16(),
          dividerColor: AppColors.light4,
          labelColor: AppColors.light1,
          indicatorColor: AppColors.light1,
          unselectedLabelColor: AppColors.dark3,
        ),

        //------------- Text Button -------------//
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),

        //------------- Outlined Button -------------//
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),

        //------------- Divider -------------//
        dividerTheme: DividerThemeData(
            thickness: 1, color: AppColors.dark5.withValues(alpha: 00.4)),

        //------------- Transition -------------//
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: AppColors.primaryColor,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.backgroundDefault,
        ),
      );
}

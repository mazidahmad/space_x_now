import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

/// SpaceX Now App Theme
/// Complete Material Design 3 theme inspired by space exploration
class AppTheme {
  // ======================= MAIN THEME DATA =======================

  /// Light theme for the SpaceX Now app
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: AppColors.lightColorScheme,
      fontFamily: 'D-DIN',

      // ======================= APP BAR THEME =======================
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.offWhite,
        foregroundColor: AppColors.spaceDeepBlue,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          fontFamily: 'D-DIN',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.spaceDeepBlue,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.spaceDeepBlue,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      // ======================= ELEVATED BUTTON THEME =======================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.rocketOrange,
          foregroundColor: AppColors.pureWhite,
          elevation: 2,
          shadowColor: AppColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontFamily: 'D-DIN',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ======================= OUTLINED BUTTON THEME =======================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.rocketOrange,
          side: const BorderSide(color: AppColors.rocketOrange, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontFamily: 'D-DIN',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ======================= TEXT BUTTON THEME =======================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.thrusterBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontFamily: 'D-DIN',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // ======================= FLOATING ACTION BUTTON THEME =======================
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.rocketOrange,
        foregroundColor: AppColors.pureWhite,
        elevation: 6,
        shape: CircleBorder(),
      ),

      // ======================= CARD THEME =======================
      cardTheme: CardThemeData(
        elevation: 4,
        shadowColor: AppColors.shadowColor,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.pureWhite,
        margin: const EdgeInsets.all(8),
      ),

      // ======================= INPUT DECORATION THEME =======================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.metallicLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.metallicLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.rocketOrange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorRed, width: 2),
        ),
        labelStyle: const TextStyle(
          color: AppColors.metallicMid,
          fontFamily: 'D-DIN',
        ),
        hintStyle: const TextStyle(
          color: AppColors.metallicLight,
          fontFamily: 'D-DIN',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),

      // ======================= CHIP THEME =======================
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightGray,
        selectedColor: AppColors.rocketOrange.withValues(alpha: 0.2),
        secondarySelectedColor: AppColors.thrusterBlue.withValues(alpha: 0.2),
        labelStyle: const TextStyle(
          color: AppColors.spaceDeepBlue,
          fontFamily: 'D-DIN',
        ),
        secondaryLabelStyle: const TextStyle(
          color: AppColors.pureWhite,
          fontFamily: 'D-DIN',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // ======================= BOTTOM NAVIGATION BAR THEME =======================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.pureWhite,
        selectedItemColor: AppColors.rocketOrange,
        unselectedItemColor: AppColors.metallicMid,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w400,
        ),
      ),

      // ======================= NAVIGATION RAIL THEME =======================
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.offWhite,
        selectedIconTheme: IconThemeData(
          color: AppColors.rocketOrange,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.metallicMid,
          size: 24,
        ),
        selectedLabelTextStyle: TextStyle(
          color: AppColors.rocketOrange,
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: AppColors.metallicMid,
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w400,
        ),
      ),

      // ======================= DIVIDER THEME =======================
      dividerTheme: const DividerThemeData(
        color: AppColors.metallicLight,
        thickness: 1,
        space: 1,
      ),

      // ======================= PROGRESS INDICATOR THEME =======================
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.rocketOrange,
        linearTrackColor: AppColors.lightGray,
        circularTrackColor: AppColors.lightGray,
      ),

      // ======================= SNACK BAR THEME =======================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.spaceDeepBlue,
        contentTextStyle: const TextStyle(
          color: AppColors.pureWhite,
          fontFamily: 'D-DIN',
        ),
        actionTextColor: AppColors.rocketOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 6,
      ),
    );
  }

  /// Dark theme for the SpaceX Now app
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: AppColors.darkColorScheme,
      fontFamily: 'D-DIN',

      // ======================= APP BAR THEME =======================
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.spaceDeepBlue,
        foregroundColor: AppColors.pureWhite,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          fontFamily: 'D-DIN',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.pureWhite,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.pureWhite,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // ======================= ELEVATED BUTTON THEME =======================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.rocketOrange,
          foregroundColor: AppColors.pureWhite,
          elevation: 4,
          shadowColor: AppColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontFamily: 'D-DIN',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ======================= OUTLINED BUTTON THEME =======================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.rocketOrange,
          side: const BorderSide(color: AppColors.rocketOrange, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontFamily: 'D-DIN',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ======================= TEXT BUTTON THEME =======================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.thrusterBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontFamily: 'D-DIN',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // ======================= FLOATING ACTION BUTTON THEME =======================
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.rocketOrange,
        foregroundColor: AppColors.pureWhite,
        elevation: 8,
        shape: CircleBorder(),
      ),

      // ======================= CARD THEME =======================
      cardTheme: CardThemeData(
        elevation: 6,
        shadowColor: AppColors.shadowColor,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.spaceLightBlue,
        margin: const EdgeInsets.all(8),
      ),

      // ======================= INPUT DECORATION THEME =======================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.spaceLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.metallicMid),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.metallicMid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.rocketOrange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorRed, width: 2),
        ),
        labelStyle: const TextStyle(
          color: AppColors.metallicBright,
          fontFamily: 'D-DIN',
        ),
        hintStyle: const TextStyle(
          color: AppColors.metallicMid,
          fontFamily: 'D-DIN',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),

      // ======================= CHIP THEME =======================
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.spaceMidBlue,
        selectedColor: AppColors.rocketOrange.withValues(alpha: 0.3),
        secondarySelectedColor: AppColors.thrusterBlue.withValues(alpha: 0.3),
        labelStyle: const TextStyle(
          color: AppColors.pureWhite,
          fontFamily: 'D-DIN',
        ),
        secondaryLabelStyle: const TextStyle(
          color: AppColors.pureWhite,
          fontFamily: 'D-DIN',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // ======================= BOTTOM NAVIGATION BAR THEME =======================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.spaceMidBlue,
        selectedItemColor: AppColors.rocketOrange,
        unselectedItemColor: AppColors.metallicBright,
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        selectedLabelStyle: TextStyle(
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w400,
        ),
      ),

      // ======================= NAVIGATION RAIL THEME =======================
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.spaceMidBlue,
        selectedIconTheme: IconThemeData(
          color: AppColors.rocketOrange,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.metallicBright,
          size: 24,
        ),
        selectedLabelTextStyle: TextStyle(
          color: AppColors.rocketOrange,
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: AppColors.metallicBright,
          fontFamily: 'D-DIN',
          fontWeight: FontWeight.w400,
        ),
      ),

      // ======================= DIVIDER THEME =======================
      dividerTheme: const DividerThemeData(
        color: AppColors.metallicMid,
        thickness: 1,
        space: 1,
      ),

      // ======================= PROGRESS INDICATOR THEME =======================
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.rocketOrange,
        linearTrackColor: AppColors.spaceMidBlue,
        circularTrackColor: AppColors.spaceMidBlue,
      ),

      // ======================= SNACK BAR THEME =======================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.spaceLightBlue,
        contentTextStyle: const TextStyle(
          color: AppColors.pureWhite,
          fontFamily: 'D-DIN',
        ),
        actionTextColor: AppColors.rocketOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 8,
      ),
    );
  }

  // ======================= UTILITY METHODS =======================

  /// Get theme based on brightness preference
  static ThemeData getTheme({required bool isDark}) {
    AppColors.setDarkTheme(isDark);
    return isDark ? darkTheme : lightTheme;
  }

  /// Space-themed gradient decoration
  static BoxDecoration get spaceGradientDecoration => BoxDecoration(
        gradient: AppColors.spaceGradient,
      );

  /// Rocket flame gradient decoration
  static BoxDecoration get rocketFlameDecoration => BoxDecoration(
        gradient: AppColors.rocketFlameGradient,
        borderRadius: BorderRadius.circular(12),
      );

  /// Mission status card decoration
  static BoxDecoration missionStatusDecoration(bool isSuccess) => BoxDecoration(
        color: isSuccess ? AppColors.successGreen : AppColors.errorRed,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: (isSuccess ? AppColors.successGreen : AppColors.errorRed)
                .withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      );

  /// Elevated card decoration with space theme
  static BoxDecoration get elevatedCardDecoration => BoxDecoration(
        color: AppColors.isDarkTheme
            ? AppColors.spaceLightBlue
            : AppColors.pureWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      );
}

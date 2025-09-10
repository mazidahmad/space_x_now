import 'package:flutter/material.dart';

/// SpaceX Now App Color Palette
/// Inspired by space exploration, astronauts, and the cosmos from the provided image
class AppColors {
  static bool isDarkTheme = true;

  // ======================= SPACE THEME CORE COLORS =======================

  // Deep Space Blues - Primary color family inspired by the cosmic background
  static const Color spaceDeepBlue = Color(0xFF0A0E27); // Deep space background
  static const Color spaceMidBlue = Color(0xFF1A1F3A); // Mid space tone
  static const Color spaceLightBlue = Color(0xFF2D3748); // Lighter space blue
  static const Color spaceAccentBlue = Color(0xFF4299E1); // Bright accent blue
  static const Color spaceCyanBlue = Color(0xFF63B3ED); // Light cyan blue

  // Metallic Astronaut Suit Colors - Inspired by the suit in the image
  static const Color metallicDark = Color(0xFF2D3748);
  static const Color metallicMid = Color(0xFF4A5568);
  static const Color metallicLight = Color(0xFF718096);
  static const Color metallicBright = Color(0xFFA0AEC0);
  static const Color chrome = Color(0xFFE2E8F0);

  // Pure Space Colors - Clean whites and blacks
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF7FAFC);
  static const Color lightGray = Color(0xFFEDF2F7);
  static const Color spaceBlack = Color(0xFF000000);

  // SpaceX Inspired Accent Colors
  static const Color rocketOrange =
      Color(0xFFFF6B35); // SpaceX signature orange
  static const Color thrusterBlue = Color(0xFF00A8FF); // Engine flame blue
  static const Color successGreen = Color(0xFF48BB78); // Mission success
  static const Color warningYellow = Color(0xFFED8936); // Caution systems
  static const Color errorRed = Color(0xFFE53E3E); // Critical alerts

  // ======================= MATERIAL DESIGN THEME INTEGRATION =======================

  /// Primary colors for the app theme
  static Color get primary => rocketOrange;
  static Color get primaryVariant => Color(0xFFCC5529);
  static Color get secondary => thrusterBlue;
  static Color get secondaryVariant => Color(0xFF0086CC);

  /// Background colors based on theme
  static Color get background => isDarkTheme ? spaceDeepBlue : offWhite;
  static Color get surface => isDarkTheme ? spaceMidBlue : pureWhite;
  static Color get cardBackground => isDarkTheme ? spaceLightBlue : lightGray;

  /// Text colors based on theme
  static Color get onPrimary => pureWhite;
  static Color get onSecondary => pureWhite;
  static Color get onBackground => isDarkTheme ? pureWhite : spaceDeepBlue;
  static Color get onSurface => isDarkTheme ? pureWhite : spaceDeepBlue;
  static Color get onError => pureWhite;

  /// Status and feedback colors
  static Color get success => successGreen;
  static Color get warning => warningYellow;
  static Color get error => errorRed;
  static Color get info => spaceAccentBlue;

  /// Interactive element colors
  static Color get buttonPrimary => rocketOrange;
  static Color get buttonSecondary => thrusterBlue;
  static Color get buttonDisabled => isDarkTheme ? metallicMid : metallicLight;
  static Color get buttonText => pureWhite;

  /// Text colors
  static Color get mainText => onBackground;
  static Color get secondaryText => isDarkTheme ? metallicBright : metallicMid;
  static Color get hintText => isDarkTheme ? metallicLight : metallicMid;
  static Color get disabledText => isDarkTheme ? metallicMid : metallicLight;

  /// Border and divider colors
  static Color get divider => isDarkTheme ? metallicMid : metallicLight;
  static Color get border => isDarkTheme ? metallicLight : metallicMid;
  static Color get focusedBorder => rocketOrange;

  /// Shadow and overlay colors
  static Color get shadowColor => spaceDeepBlue.withValues(alpha: 0.3);
  static Color get overlayColor => spaceDeepBlue.withValues(alpha: 0.6);
  static Color get scrimColor => spaceDeepBlue.withValues(alpha: 0.8);

  // ======================= COMPLETE MATERIAL COLOR SCHEMES =======================

  /// Light theme ColorScheme for Material 3
  static const ColorScheme lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: rocketOrange,
    onPrimary: pureWhite,
    primaryContainer: Color(0xFFFFDAD4),
    onPrimaryContainer: Color(0xFF2D1600),
    secondary: thrusterBlue,
    onSecondary: pureWhite,
    secondaryContainer: Color(0xFFCCE7FF),
    onSecondaryContainer: Color(0xFF001E30),
    tertiary: spaceAccentBlue,
    onTertiary: pureWhite,
    tertiaryContainer: Color(0xFFD8E2FF),
    onTertiaryContainer: Color(0xFF0D1B2C),
    error: errorRed,
    onError: pureWhite,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: offWhite,
    onSurface: spaceDeepBlue,
    surfaceContainer: lightGray,
    onSurfaceVariant: metallicMid,
    outline: metallicLight,
    outlineVariant: metallicBright,
    shadow: spaceDeepBlue,
    scrim: spaceDeepBlue,
    inverseSurface: spaceLightBlue,
    onInverseSurface: pureWhite,
    inversePrimary: Color(0xFFFFB4A3),
    surfaceTint: rocketOrange,
  );

  /// Dark theme ColorScheme for Material 3
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: rocketOrange,
    onPrimary: Color(0xFF2D1600),
    primaryContainer: Color(0xFF7D2C00),
    onPrimaryContainer: Color(0xFFFFDAD4),
    secondary: thrusterBlue,
    onSecondary: Color(0xFF001E30),
    secondaryContainer: Color(0xFF004B73),
    onSecondaryContainer: Color(0xFFCCE7FF),
    tertiary: spaceCyanBlue,
    onTertiary: Color(0xFF0D1B2C),
    tertiaryContainer: Color(0xFF253140),
    onTertiaryContainer: Color(0xFFD8E2FF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: spaceLightBlue,
    onSurface: pureWhite,
    surfaceContainer: metallicMid,
    outline: metallicLight,
    outlineVariant: metallicMid,
    shadow: spaceDeepBlue,
    scrim: spaceDeepBlue,
    inverseSurface: chrome,
    onInverseSurface: spaceDeepBlue,
    inversePrimary: rocketOrange,
    surfaceTint: rocketOrange,
  );

  // ======================= SPECIALIZED SPACE COLORS =======================

  /// Space mission status colors
  static const Color missionSuccess = successGreen;
  static const Color missionPending = warningYellow;
  static const Color missionFailed = errorRed;
  static const Color missionAborted = Color(0xFF9CA3AF);

  /// Rocket stage colors
  static const Color firstStage = rocketOrange;
  static const Color secondStage = thrusterBlue;
  static const Color payload = spaceCyanBlue;

  /// Launch pad status colors
  static const Color launchPadActive = successGreen;
  static const Color launchPadInactive = metallicMid;
  static const Color launchPadMaintenance = warningYellow;

  // ======================= LEGACY COMPATIBILITY COLORS =======================

  // Core white (commonly used in existing code)
  static const Color coreWhite = pureWhite;

  // Neutral grays for backward compatibility
  static const Color neutralGray100 = lightGray;
  static const Color neutralGray200 = metallicBright;
  static const Color neutralGray500 = metallicMid;
  static const Color neutralGray600 = metallicLight;
  static const Color neutralGray700 = metallicMid;
  static const Color neutralGray900 = metallicDark;

  // Legacy status colors
  static Color get success900 => Color(0xFF065F46);
  static Color get error900 => Color(0xFF7F1D1D);
  static Color get error500 => errorRed;
  static Color get info500 => spaceAccentBlue;

  // Legacy content colors
  static Color get contentPrimary => onSurface;
  static Color get contentSecondary => secondaryText;
  static Color get contentTertiary => hintText;

  // Legacy background colors
  static Color get backgroundScreen => background;
  static Color get backgroundSecondary => surface;
  static Color get backgroundTertiary => cardBackground;

  // ======================= UTILITY METHODS =======================

  /// Switch between light and dark theme
  static void setDarkTheme(bool dark) {
    isDarkTheme = dark;
  }

  /// Get current ColorScheme based on theme
  static ColorScheme get currentColorScheme =>
      isDarkTheme ? darkColorScheme : lightColorScheme;

  /// Create a ThemeData with space theme colors
  static ThemeData createThemeData({required bool isDark}) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: isDark ? darkColorScheme : lightColorScheme,
      fontFamily: 'D-DIN', // Space-themed font from your assets
    );
  }

  /// Helper method to get appropriate text color for a background
  static Color getTextColorForBackground(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? spaceDeepBlue : pureWhite;
  }

  /// Helper method to create gradient backgrounds
  static LinearGradient get spaceGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [spaceDeepBlue, spaceMidBlue, spaceLightBlue],
      );

  /// Helper method for rocket flame gradient
  static LinearGradient get rocketFlameGradient => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [rocketOrange, thrusterBlue, spaceCyanBlue],
      );
}

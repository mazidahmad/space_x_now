import 'package:flutter/material.dart';

class AppColors {
  static bool isDarkTheme = true;

  // ======================= DARK / LIGHT MODE =======================
  /* CORE */
  static Color get mainText => isDarkTheme ? darkTextColor : lightTextColor;
  static Color get secondaryText =>
      isDarkTheme ? neutralGray200 : neutralGray600;
  static Color get mainIcon => isDarkTheme ? Colors.white : primaryPurple500;
  static Color get accent1 => isDarkTheme ? darkAccent1 : lightAccent1;
  static Color get accent2 => isDarkTheme ? darkAccent2 : lightAccent2;
  static Color get buttonText => isDarkTheme ? Colors.white : Colors.black;

  /* CONTENT */
  static Color get contentPrimary =>
      isDarkTheme ? darkContentPrimary : lightContentPrimary;
  static Color get contentSecondary =>
      isDarkTheme ? darkContentSecondary : lightContentSecondary;
  static Color get contentTertiary =>
      isDarkTheme ? darkContentTertiary : lightContentTertiary;

  /* BACKGROUND */
  static Color get backgroundScreen =>
      isDarkTheme ? darkBackgroundDark : lightBackgroundDark;
  static Color get backgroundSecondary =>
      isDarkTheme ? darkBackgroundSecondary : lightBackgroundSecondary;
  static Color get backgroundTertiary =>
      isDarkTheme ? darkBackgroundTertiary : lightBackgroundTertiary;
  static Color get exerciseLabelBackground => isDarkTheme
      ? darkBackgroundSecondary.withValues(alpha: 0.7)
      : lightBackgroundPrimary.withValues(alpha: 0.3);

  /* OTHERS */
  static Color get tabLabel => isDarkTheme ? neutralGray200 : neutralGray500;
  static Color get activeBubble =>
      isDarkTheme ? primaryPurple600 : primaryPurple50;
  static Color get passiveBubble =>
      isDarkTheme ? secondaryOrange700 : secondaryOrange100;
  static Color get chatDate => isDarkTheme
      ? gradientPurplePrimary.withValues(alpha: 0.5)
      : neutralGray100;
  static Color get activeTherapistDetailChat =>
      isDarkTheme ? darkTextColor : primaryPurple500;
  static Color get inactiveTherapistDetailChat =>
      isDarkTheme ? neutralGray700 : neutralGray500;
  static Color get arrowButton => isDarkTheme
      ? darkBackgroundSecondary.withValues(alpha: 0.3)
      : primaryPurple50;
  static Color get disabledButton =>
      isDarkTheme ? primaryPurple900 : neutralGray100;
  static Color get startFlare => isDarkTheme
      ? coreWhite.withValues(alpha: 0)
      : primaryPurple50.withValues(alpha: 0);
  static Color get endFlare => isDarkTheme ? coreWhite : primaryPurple50;
  static Color get activeChip =>
      isDarkTheme ? AppColors.primaryPurple600 : AppColors.primaryPurple500;
  static Color get moodTrackCard =>
      isDarkTheme ? AppColors.primaryPurple900 : AppColors.primaryPurple400;
  static Color get appointmentNavigationBg =>
      isDarkTheme ? AppColors.primaryPurple900 : AppColors.primaryPurple50;
  static Color get pillBg =>
      isDarkTheme ? AppColors.secondaryOrange800 : AppColors.secondaryOrange400;
  static Color get referenceScoreColor =>
      isDarkTheme ? AppColors.secondaryYellow500 : AppColors.contentTertiary;
  static Color get circularUnselectedProgressColor =>
      isDarkTheme ? AppColors.primaryPurple700 : AppColors.primaryPurple400;
  static Color get circularSelectedProgressColor =>
      isDarkTheme ? AppColors.secondaryOrange500 : AppColors.secondaryOrange400;
  static Color get progressLinearIndicatorColor =>
      isDarkTheme ? AppColors.primaryPurple800 : AppColors.primaryPurple100;

  static Color get greenCard => isDarkTheme ? greedCardDark : greedCardLight;
  static Color get redCard => isDarkTheme ? redCardDark : redCardLight;
  static Color get blueCard => isDarkTheme ? blueCardDark : blueCardLight;
  static Color get yellowCard => isDarkTheme ? yellowCardDark : yellowCardLight;

  /* APPOINTMENT */
  static Color get videoGrid =>
      isDarkTheme ? AppColors.primaryPurple900 : AppColors.primaryPurple500;
  static Color get videoCallButton => isDarkTheme
      ? secondaryOrange900.withValues(alpha: 0.3)
      : backgroundSecondary.withValues(alpha: 0.3);
  static Color get leave => isDarkTheme ? error900 : error500;

  /* BORDER */
  static Color get stroke1 => isDarkTheme ? darkStroke1 : lightStroke1;
  static Color get stroke2 => isDarkTheme ? darkStroke2 : lightStroke2;
  static Color get therapistProfile =>
      isDarkTheme ? primaryPurple900 : primaryPurple50;

  // ======================= BASIC COLORS =======================
  /* CORE */
  static const MaterialColor primary = MaterialColor(
    0xFF544BA0, // Default/Primary Color
    <int, Color>{
      900: primaryPurple900,
      800: primaryPurple800,
      700: primaryPurple700,
      600: primaryPurple600,
      500: primaryPurple500,
      400: primaryPurple400,
      300: primaryPurple300,
      200: primaryPurple200,
      100: primaryPurple100,
      50: primaryPurple50,
    },
  );

  /* MOOD */
  static Color get moodJoyEcstasySerenity =>
      isDarkTheme ? secondaryYellow500 : secondaryYellow100;

  static Color get moodAdmirationTrustAcceptance =>
      isDarkTheme ? success500 : success100;
  static Color get moodTerrorFearApprehension =>
      isDarkTheme ? success900 : success100;
  static Color get moodAmazementSurpriseDistraction =>
      isDarkTheme ? info500 : info100;
  static Color get moodGriefSadnessPensiveness =>
      isDarkTheme ? info600 : info100;
  static Color get moodLoathingDisgustBoredom =>
      isDarkTheme ? primaryPurple400 : primaryPurple100;
  static Color get moodRageAngerAnnoyance => isDarkTheme ? error600 : error100;
  static Color get moodVigilanceAnticipationInterest =>
      isDarkTheme ? secondaryOrange400 : secondaryOrange100;

  /* INFO */
  static Color get infoBg => isDarkTheme ? info900 : info700;
  static Color get errorBg => isDarkTheme ? error900 : error700;
  static Color get successBg => isDarkTheme ? success900 : success700;
  static Color get warningBg => isDarkTheme ? error900 : error700;

  static const MaterialColor secondary1 = MaterialColor(
    0xFFF98128, // Default/Primary Color
    <int, Color>{
      900: secondaryOrange900,
      800: secondaryOrange800,
      700: secondaryOrange700,
      600: secondaryOrange600,
      500: secondaryOrange500,
      400: secondaryOrange400,
      300: secondaryOrange300,
      200: secondaryOrange200,
      100: secondaryOrange100,
      50: secondaryOrange50,
    },
  );

  static const MaterialColor secondary2 = MaterialColor(
    0xFFF4CA16, // Default/Primary Color
    <int, Color>{
      900: secondaryYellow900,
      800: secondaryYellow800,
      700: secondaryYellow700,
      600: secondaryYellow600,
      500: secondaryYellow500,
      400: secondaryYellow400,
      300: secondaryYellow300,
      200: secondaryYellow200,
      100: secondaryYellow100,
      50: secondaryYellow50,
    },
  );
  // DARK
  static const Color darkAccent1 = Color(0xFF8F8BC2);
  static const Color darkAccent2 = Color(0xFFC5C2DA);
  // LIGHT
  static const Color lightAccent1 = Color(0xFF8F8BC2);
  static const Color lightAccent2 = Color(0xFFC5C2DA);

  static const MaterialColor negative = MaterialColor(
    0xFFFF8884,
    <int, Color>{
      900: error900,
      700: error700,
      600: error600,
      500: error500,
      200: error200,
      100: error100,
    },
  );
  static const Color warning = Color(0xFFFBE772);
  static const MaterialColor success = MaterialColor(
    0xFF35C2FF,
    <int, Color>{
      900: success900,
      700: success700,
      600: success600,
      500: success500,
      200: success200,
      100: success100,
    },
  );
  static const MaterialColor info = MaterialColor(
    0xFFFF8884,
    <int, Color>{
      900: info900,
      700: info700,
      600: info600,
      500: info500,
      200: info200,
      100: info100,
    },
  );

  static const Color darkTextColor = Colors.white;
  static const Color lightTextColor = Color(0xFF2A3A48);
  static const Color darkButtonTextColor = Colors.white;
  static const Color lightButtonTextColor = Colors.white;

  /* PRIMITIVES */
  // PRIMARY PURPLE
  static const Color primaryPurple900 = Color(0xFF120E4C);
  static const Color primaryPurple800 = Color(0xFF1C175C);
  static const Color primaryPurple700 = Color(0xFF2C2573);
  static const Color primaryPurple600 = Color(0xFF3E3689);
  static const Color primaryPurple500 = Color(0xFF544BA0);
  static const Color primaryPurple400 = Color(0xFF8077C5);
  static const Color primaryPurple300 = Color(0xFFA39AE2);
  static const Color primaryPurple200 = Color(0xFFC8C1F5);
  static const Color primaryPurple100 = Color(0xFFE3DFFA);
  static const Color primaryPurple50 = Color(0xFFF0EEFF);

  // SECONDARY ORANGE
  static const Color secondaryOrange900 = Color(0xFF771D07);
  static const Color secondaryOrange800 = Color(0xFF902E0C);
  static const Color secondaryOrange700 = Color(0xFFB34514);
  static const Color secondaryOrange600 = Color(0xFFD6611D);
  static const Color secondaryOrange500 = Color(0xFFF98128);
  static const Color secondaryOrange400 = Color(0xFFE6A596);
  static const Color secondaryOrange300 = Color(0xFFFDC27D);
  static const Color secondaryOrange200 = Color(0xFFFEDBA8);
  static const Color secondaryOrange100 = Color(0xFFFEEFD3);
  static const Color secondaryOrange50 = Color(0xFFFFFAF1);

  // SECONDARY YELLOW
  static const Color secondaryYellow900 = Color(0xFF755604);
  static const Color secondaryYellow800 = Color(0xFF8D6C07);
  static const Color secondaryYellow700 = Color(0xFFAF8A0B);
  static const Color secondaryYellow600 = Color(0xFFD1A910);
  static const Color secondaryYellow500 = Color(0xFFF4CA16);
  static const Color secondaryYellow400 = Color(0xFFF8DB4E);
  static const Color secondaryYellow300 = Color(0xFFFBE772);
  static const Color secondaryYellow200 = Color(0xFFFDF1A1);
  static const Color secondaryYellow100 = Color(0xFFFEF9D0);
  static const Color secondaryYellow50 = Color(0xFFFFFDEE);

  // ERROR
  static const Color error900 = Color(0xFF7A1937);
  static const Color error700 = Color(0xFFB74252);
  static const Color error600 = Color(0xFFDB6066);
  static const Color error500 = Color(0xFFFF8884);
  static const Color error200 = Color(0xFFFFC4B5);
  static const Color error100 = Color(0xFFFFEFE6);

  // SUCCESS
  static const Color success900 = Color(0xFF116B3C);
  static const Color success700 = Color(0xFF1D8144);
  static const Color success600 = Color(0xFF2EA150);
  static const Color success500 = Color(0xFF5CE06B);
  static const Color success200 = Color(0xFFCAFBC0);
  static const Color success100 = Color(0xFFE7FDDF);

  // INFO
  static const Color info900 = Color(0xFF0A3A7A);
  static const Color info700 = Color(0xFF105293);
  static const Color info600 = Color(0xFF1A73B7);
  static const Color info500 = Color(0xFF35C2FF);
  static const Color info200 = Color(0xFFAEF6FF);
  static const Color info100 = Color(0xFFD6FDFF);

  // NEUTRAL GRAY
  static const Color neutralGray900 = Color(0xFF262222);
  static const Color neutralGray800 = Color(0xFF4A4444);
  static const Color neutralGray700 = Color(0xFF6E6666);
  static const Color neutralGray600 = Color(0xFF918A89);
  static const Color neutralGray500 = Color(0xFFB5B1AE);
  static const Color neutralGray400 = Color(0xFFC7C2C0);
  static const Color neutralGray300 = Color(0xFFD9D5D3);
  static const Color neutralGray200 = Color(0xFFEBE8E6);
  static const Color neutralGray100 = Color(0xFFFCFBFA);

  // ======================= SEMANTIC =======================
  static const Color darkBackgroundPrimary = AppColors.primaryPurple900;
  static const Color darkBackgroundSecondary = Color(0xFF111030);
  static const Color darkBackgroundTertiary = Color(0xFFE8E8E8);
  static const Color darkBackgroundDark = Color(0xFF0E0E28);
  static const Color darkBackgroundBlack = Color(0xFF070707);

  static const Color lightBackgroundPrimary = Colors.white;
  static const Color lightBackgroundSecondary = Color(0xFFFAF9FF);
  static const Color lightBackgroundTertiary = Color(0xFF2A3A48);
  static const Color lightBackgroundDark = Colors.white;
  static const Color lightBackgroundBlack = Color(0xFF070707);

  /* CONTENT */
  // DARK
  static const Color darkContentPrimary = Color(0xFF2A3A48);
  static const Color darkContentSecondary = Color(0xFF4B4B4B);
  static const Color darkContentTertiary = Color(0xFF5E5E5E);
  // LIGHT
  static const Color lightContentPrimary = Color(0xFF2A3A48);
  static const Color lightContentSecondary = Color(0xFF4B4B4B);
  static const Color lightContentTertiary = Color(0xFF5E5E5E);

  // ======================= BORDER =======================
  static const Color borderOpaque = Color(0xFFE8E8E8);
  static const Color borderTransparent = Color(0x00000014);
  static const Color darkBorderSelected = Color(0xFF2A3A48);
  static const Color lightBorderSelected = Color(0xFFB2AAEE);
  static Color darkStroke1 = const Color(0xFF499EFF).withValues(alpha: 0.35);
  static Color lightStroke1 = const Color(0xFFD9D5D3);
  static Color darkStroke2 = const Color(0xFF499EFF).withValues(alpha: 0.15);
  static Color lightStroke2 = const Color(0xFFD9D5D3).withValues(alpha: 0.15);

  // ======================= GRADIENT =======================
  static const Color gradientPurplePrimary = Color(0xFF1F1F52);
  static const Color gradientPurpleSecondary = Color(0xFF1B154D);

  static const Color gradientLightPurplePrimary = Color(0xff499EFF);
  static const Color gradientLightPurpleSecondary = Color(0xff5f51ff);

  static const Color gradientLightPurple1 = Color(0xff499EFF);
  static const Color gradientLightPurple2 = Color(0xff5F51FF);

  static const Color gradientOrange1 = Color(0xffEA6400);
  static const Color gradientOrange2 = Color(0xffC19C00);

  // stroke
  static const Color darkBorderStroke2 = Color(0xFF499EFF);
  static const Color lightBorderStroke2 = Color(0xFFD9D5D3);

  // ======================= GRAY =======================

  static const Color lightGray1 = Color(0xFFC4C2DA);

  static const Color red = Color(0xFFEF4B4B);

  static const Color infoBlue700 = Color(0xFF1A73B7);
  static const Color infoBlue500 = Color(0xFF35C2FF);

  static const Color blueBlurCircle = Color(0xFF0A0E51);

  // ======================= HOME =======================
  static const Color greedCardDark = Color(0xFF1FAF90);
  static const Color greedCardLight = Color(0xFFA2E1D4);
  static const Color redCardDark = Color(0xFFFD4D8D);
  static const Color redCardLight = Color(0xFFFFE8E9);
  static const Color blueCardDark = Color(0xFF2D96E6);
  static const Color blueCardLight = Color(0xFFD5EAFF);
  static const Color yellowCardDark = secondaryOrange600;
  static const Color yellowCardLight = Color(0xFFFFE6AB);

  // ======================= CORE =======================
  static const Color coreWhite = Color(0xFFFFFFFF);
}

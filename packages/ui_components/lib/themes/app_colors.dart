import 'package:flutter/material.dart';

class AppColors {
  // Global
  static const Color primaryColor = Color(0xFFEFB205);

  static MaterialColor primarySwatch = const MaterialColor(
    0xFFEFB205, // Default/Primary Color
    <int, Color>{
      100: Color(0xFF99FBDB),
      200: Color(0xFF504432),
      300: Color(0xFF64522c),
      400: Color(0xFF786026),
      500: Color(0xFF8b6e21),
      600: Color(0xFF9f7b1b),
      700: Color(0xFFb38916),
      800: Color(0xFFb38916),
      900: Color(0xFFb38916),
    },
  );

  static MaterialColor primarySwatchDarker =
      const MaterialColor(0xFFc59305, {});
  static MaterialColor primarySwatchLighter =
      const MaterialColor(0xFFfad057, {});

  static const Color secondaryColor = Color(0xFFf1e49d);

  static MaterialColor secondarySwatch = const MaterialColor(
    0xFFf1e49d, // Default/Primary Color
    <int, Color>{
      100: Color(0xFF3d3d48),
      200: Color(0xFF505052),
      300: Color(0xFF65625d),
      400: Color(0xFF797567),
      500: Color(0xFF8d8772),
      600: Color(0xFFa19b7d),
      700: Color(0xFFb5ad87),
      800: Color(0xFFcac092),
      900: Color(0xFFddd193),
    },
  );

  static MaterialColor secondarySwatchDarker =
      const MaterialColor(0xFFfff5b9, {});
  static MaterialColor secondarySwatchLighter =
      const MaterialColor(0xFFdece76, {});

  static const Color light0 = Color(0xFFA4A5AD);
  static const Color light1 = Color(0xFFEBEBF0);
  static const Color light4 = Color(0xFFFFFFFF);

  static Color bg01 = const Color(0xFF3F3F3F).withValues(alpha: 0.31);

  static const Color dark0 = Color(0xFF202124);
  static const Color dark1 = Color(0xFF1C1C1E);
  static const Color dark2 = Color(0xFF262626);
  static const Color dark3 = Color(0xFF8E8E92);
  static const Color dark4 = Color(0xFF656564);
  static const Color dark5 = Color(0xFF424446);
  static const Color darkBlue = Color(0xFF373E4E);
  static const Color darkBlue2 = Color(0xFF272A35);
  static Color darkBg0 = const Color(0xff3F3F3F).withValues(alpha: 0.31);
  static Color darkBg1 = const Color(0xff2E2D2D).withValues(alpha: 0.57);

  static Color shadow = const Color(0xFF141414).withValues(alpha: 0.24);

  static const Color green0 = Color(0xFF05A660);
  static const Color green1 = Color(0xFF2FD058);
  static const Color green2 = Color(0xFF39D98A);

  static const Color blue1 = Color(0xFF0095F6);
  static Color blue3 = const Color(0xFF5B8DEF).withValues(alpha: 0.43);

  static const Color red1 = Color(0xFFFF3B3B);
  static const Color red2 = Color(0xFFFF5C5C);

  // Text
  static const Color textPrimary = light4;
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color textBlack = dark0;

  // Background
  static const Color backgroundDefault = dark0;
  static const Color backgroundSecondary = dark1;

  static LinearGradient gradient1 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF6D87B),
      Color(0xFFF6F2C1),
      Color(0xFFF6E27B),
    ],
  );

  static LinearGradient gradient2 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFF8800),
      Color(0xFFE63535),
    ],
  );

  static LinearGradient gradient3 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3E7BFA),
      Color(0xFF6600CC),
    ],
  );

  static LinearGradient gradient4 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF00CFDE),
      Color(0xFF05A660),
    ],
  );

  static LinearGradient gradient5 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFDDD48),
      Color(0xFF00B7C4),
    ],
  );

  static LinearGradient gradient6 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFDDD48),
      Color(0xFF00B7C4),
    ],
  );

  static LinearGradient gradient7 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFF3B3B),
      Color(0xFF6600CC),
    ],
  );

  static LinearGradient gradient8 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF73DFE7),
      Color(0xFF0063F7),
    ],
  );

  static LinearGradient gradient9 = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFAC5DD9),
      Color(0xFF004FC4),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: secondaryColor,
      background: whiteBackGround,
      primary: primaryColor,
    ),
    useMaterial3: true,
    fontFamily:
        compFont.fontFamily, // Using IBM Plex Sans Arabic as default font
    textTheme: TextTheme(
      // Title XLarge
      displayLarge: compFont.copyWith(
        fontSize: 34,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.21, // Leading point of 41px (41/34)
      ),
      // Title Large
      displayMedium: compFont.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.21, // Leading point of 34px (34/28)
      ),
      // Title Medium
      displaySmall: compFont.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.25, // Leading point of 30px (30/24)
      ),
      // Title Small
      headlineMedium: compFont.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.36, // Leading point of 30px (30/22)
      ),
      // Headline Large
      headlineSmall: compFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.3, // Leading point of 26px (26/20)
      ),
      // Headline Small
      titleLarge: compFont.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.33, // Leading point of 24px (24/18)
      ),
      // Subhead Large
      titleMedium: compFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.25, // Leading point of 20px (20/16)
      ),
      // Subhead Small
      titleSmall: compFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.29, // Leading point of 18px (18/14)
      ),
      // Body Large
      bodyLarge: compFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        height: 1.5, // Leading point of 24px (24/16)
      ),
      // Body Medium
      bodyMedium: compFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.57, // Leading point of 22px (22/14)
      ),
      // Body Small
      labelLarge: compFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.5, // Leading point of 18px (18/12)
      ),
      // Label Large
      bodySmall: compFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.5, // Leading point of 24px (24/16)
      ),
      // Label Medium
      labelMedium: compFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.29, // Leading point of 18px (18/14)
      ),
      // Label Small
      labelSmall: compFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.33, // Leading point of 16px (16/12)
      ),
    ),
  );
}

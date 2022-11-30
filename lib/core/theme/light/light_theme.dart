import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/constants/text_styles.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

final ThemeData lightTheme = ThemeData(
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColorsLight.kAppPrimaryColorLight,
    scaffoldBackgroundColor: AppColorsLight.kScaffoldBackGroundColor,
    textTheme: TextTheme(
        headlineLarge: headingTextStyle,
        displayLarge: headingTextStyle,
        headlineMedium: subHeadingTextStyle,
        bodyLarge: regularTextStyle,
        bodyMedium: bodyTextStyle),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: AppColorsLight.kCircularProgressTrackColor,
        color: AppColorsLight.kCircularProgressColor));

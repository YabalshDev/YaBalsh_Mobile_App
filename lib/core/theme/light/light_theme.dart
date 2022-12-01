import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/constants/text_styles.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

final ButtonStyle kMainButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(kDefaultPadding),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: kDefaultBorderRaduis,
    )),
    backgroundColor:
        MaterialStateProperty.all(AppColorsLight.kAppPrimaryColorLight),
    textStyle: MaterialStateProperty.all(buttonTextStyle),
    elevation: MaterialStateProperty.all(1),
    fixedSize: MaterialStateProperty.all(
      Size(345.w, 51.h),
    ));

final ThemeData lightTheme = ThemeData(
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColorsLight.kAppPrimaryColorLight,
    scaffoldBackgroundColor: AppColorsLight.kScaffoldBackGroundColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColorsLight.kAppPrimaryColorLight,
      disabledColor: AppColorsLight.kDisabledButtonColor,
      textTheme: ButtonTextTheme.normal,
      height: 51.h,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: kMainButtonStyle),
    textTheme: TextTheme(
        headlineLarge: headingTextStyle,
        displayLarge: headingTextStyle,
        headlineMedium: subHeadingTextStyle,
        bodyLarge: regularTextStyle,
        bodyMedium: bodyTextStyle),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: AppColorsLight.kCircularProgressTrackColor,
        color: AppColorsLight.kCircularProgressColor));
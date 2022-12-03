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
    textStyle: MaterialStateProperty.all(kActivebuttonTextStyle),
    elevation: MaterialStateProperty.all(1),
    fixedSize: MaterialStateProperty.all(
      Size(345.w, 51.h),
    ));

final ThemeData lightTheme = ThemeData(
    fontFamily: AppStrings.fontFamily,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: kSecondaryBorderRaduis),
      color: AppColorsLight.kDisabledButtonColor,
      elevation: 1,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        iconTheme: IconThemeData(size: 12.h)),
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
        bodyMedium: bodyTextStyle,
        bodySmall: kBottomNavbuttonTextStyle),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: AppColorsLight.kCircularProgressTrackColor,
        color: AppColorsLight.kCircularProgressColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColorsLight.kAppPrimaryColorLight,
        unselectedItemColor: Colors.black,
        backgroundColor: AppColorsLight.kScaffoldBackGroundColor,
        selectedLabelStyle: kBottomNavbuttonTextStyle,
        showSelectedLabels: true,
        showUnselectedLabels: true));

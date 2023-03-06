import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/light/app_colors_light.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
              width: 220.w,
              height: 120.h,
              child: AspectRatio(
                aspectRatio: 220.w / 120.h,
                child: Image.asset(
                  AppAssets.splash,
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              AppStrings.splashHeading,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColorsLight.kAppPrimaryColorLight),
            ),
          ),
          Center(
            child: Text(
              AppStrings.splashSubHeading,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColorsLight.kAppPrimaryColorLight),
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator.adaptive(),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}

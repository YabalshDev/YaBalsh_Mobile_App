import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}

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
              width: 190.w,
              height: 55.h,
              child: Image.asset(
                AppAssets.logo,
                fit: BoxFit.cover,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontFamily: 'Gotham',
                      color: AppColorsLight.kAppPrimaryColorLight,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontFamily: 'Gotham',
                              color: const Color(0xFFEDA832),
                              fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: 'YaBalash'),
                  ])),

          // SizedBox(
          //     width: 172.w,
          //     height: 80.h,
          //     child: AspectRatio(
          //       aspectRatio: 2.15,
          //       child: Image.asset(
          //         AppAssets.splash,
          //         fit: BoxFit.contain,
          //       ),
          //     )),
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

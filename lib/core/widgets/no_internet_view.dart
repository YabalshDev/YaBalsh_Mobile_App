import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Center(
            child: CustomSvgIcon(
              iconPath: AppAssets.noWifiIcon,
              color: Colors.grey.shade300,
            ),
          ),
          largeVerticalSpace,
          Text(
            'لا يوجد اتصال بالانترنت حاول مرة اخرى',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

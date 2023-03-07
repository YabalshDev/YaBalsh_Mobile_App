import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'compare_supermarkets_button.dart';

class ShoppingListDetailsBottomLoading extends StatelessWidget {
  const ShoppingListDetailsBottomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          getIt<AppSettingsService>().appConfig.appVersion == '1.0.0'
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SubHeading(text: 'الاجمالي'),
            Shimmer.fromColors(
                baseColor: Colors.grey[800]!,
                highlightColor: Colors.grey[850]!,
                child: SizedBox(
                  height: 10.h,
                  width: 72.w,
                )),
            const Spacer(),
            Shimmer.fromColors(
                baseColor: Colors.grey[800]!,
                highlightColor: Colors.grey[850]!,
                child: SizedBox(
                  height: 18.h,
                  width: 88.w,
                ))
          ],
        ),
        getIt<AppSettingsService>().appConfig.appVersion != '1.0.0'
            ? const SizedBox()
            : const Spacer(),
        getIt<AppSettingsService>().appConfig.appVersion != '1.0.0'
            ? const SizedBox()
            : const CompareSupermarketsButton(),
        smallVerticalSpace
      ],
    );
  }
}

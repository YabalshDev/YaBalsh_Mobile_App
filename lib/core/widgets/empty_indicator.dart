import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/utils/enums/empty_states.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';

class EmptyIndicator extends StatelessWidget {
  final String title;
  final EmptyStates emptyStateType;
  const EmptyIndicator(
      {super.key, required this.title, required this.emptyStateType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvgIcon(
          iconPath: emptyStateType == EmptyStates.cart ||
                  emptyStateType == EmptyStates.other
              ? AppAssets.emptyBasket
              : emptyStateType == EmptyStates.addresses
                  ? AppAssets.emptyAddress
                  : AppAssets.emptyAddress,
          width: 130.w,
          height: 130.h,
          boxFit: BoxFit.fill,
        ),
        largeVerticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

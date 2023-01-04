import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../addresses/presentation/widgets/address_card.dart';
import '../blocs/cubit/order_summary_cubit.dart';

class UserAddressCard extends StatelessWidget {
  final OrderSummaryState state;
  const UserAddressCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.userAddresses!.isNotEmpty
        ? AddressContainer(
            isWithPrimary: false,
            isPrimary: false,
            fromRoute: RouteHelper.getCartRoute(),
            index: -1,
            address: state.userAddresses!.last,
          )
        : Container(
            height: 47.h,
            padding: kDefaultPadding,
            decoration: kDefaultBoxDecoration.copyWith(
                color: AppColorsLight.kAddressBackgroundColor,
                border: Border.all(
                    color: AppColorsLight.kAddressBorderColor, width: 2)),
            child: Row(
              children: [
                Row(
                  children: [
                    CustomSvgIcon(
                      iconPath: AppAssets.addressesIcon,
                      width: 14.w,
                      height: 16.h,
                      color: AppColorsLight.kAppPrimaryColorLight,
                    ),
                    smallHorizontalSpace,
                    Text(
                      'لا يوجد عنوان',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: AppColorsLight.kAppPrimaryColorLight),
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.toNamed(RouteHelper.getUpdateAddress(),
                      arguments: [false, null, RouteHelper.getCartRoute()]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColorsLight.kAppPrimaryColorLight,
                        size: 18.h,
                      ),
                      smallHorizontalSpace,
                      Text(
                        'اضف العنوان',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: AppColorsLight.kAppPrimaryColorLight),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/address_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../domain/entities/address.dart';

class AddressCard extends StatelessWidget {
  final Address? address;
  final int index;
  final bool? isPrimary;
  const AddressCard(
      {super.key, this.address, required this.index, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${address!.id}'),
      direction: DismissDirection.startToEnd,
      background: Container(
        decoration: const BoxDecoration(
          color: AppColorsLight.kErrorColor,
        ),
        padding: kDefaultPadding,
        child: Row(
          children: const [
            CustomSvgIcon(
              iconPath: AppAssets.binIcon,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: Container(
        decoration: kDefaultBoxDecoration.copyWith(
            border: Border.all(color: Colors.transparent)),
        height: 200.h,
        padding: kDefaultPadding,
        child: Container(
          padding: kDefaultPadding,
          decoration: kDefaultBoxDecoration.copyWith(
              color: AppColorsLight.kAddressBackgroundColor,
              border: Border.all(
                  color: AppColorsLight.kAddressBorderColor, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomSvgIcon(
                    iconPath: AppAssets.homeAddressIcon,
                    width: 18.w,
                    height: 18.h,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                  smallHorizontalSpace,
                  Text(
                    'بيت الشروق',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  )
                ],
              ),
              mediumVerticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSvgIcon(
                    iconPath: AppAssets.addressesIcon,
                    width: 18.w,
                    height: 18.h,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                  smallHorizontalSpace,
                  Text(
                    '${address!.fullAddress!.split(',')[0]},${getIt<ZoneService>().currentSubZone!.name},${getIt<ZoneService>().currentSubZone!.mainZoneName}',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  )
                ],
              ),
              mediumVerticalSpace,
              Text(
                '  ${address!.fullAddress}',
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color:
                        AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
              ),
              mediumVerticalSpace,
              Text(
                '  رقم المبني ${address!.buildingNo}، رقم الدور ${address!.floor}, رقم الشقة ${address!.apartmentNo}',
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
              ),
              mediumVerticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => BlocProvider.of<AddressCubit>(context)
                        .setIsPrimary(index),
                    child: Row(
                      children: [
                        Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: BoxDecoration(
                              color: isPrimary!
                                  ? AppColorsLight.kAppPrimaryColorLight
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 2)),
                        ),
                        smallHorizontalSpace,
                        Text(
                          'عنوان اساسي',
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight
                                      .withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(RouteHelper.getUpdateAddress(),
                        arguments: [true, address]),
                    child: Row(
                      children: [
                        const CustomSvgIcon(
                          iconPath: AppAssets.pencilIcon,
                          color: AppColorsLight.kAppPrimaryColorLight,
                        ),
                        smallHorizontalSpace,
                        Text(
                          'تغيير العنوان',
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

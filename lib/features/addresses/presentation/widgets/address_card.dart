import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/address_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/services/addresses_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../domain/entities/address.dart';

class AddressCard extends StatelessWidget {
  final Address? address;
  final int index;
  final bool? isPrimary;
  final String fromRoute;
  const AddressCard(
      {super.key,
      this.address,
      required this.index,
      this.isPrimary = false,
      required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ObjectKey(address!),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          yaBalashCustomDialog(
            buttonTitle: 'تاكيد',
            isWithEmoji: false,
            onClose: () {
              BlocProvider.of<AddressCubit>(context, listen: false)
                  .handleDeleteDialogClose();
              Get.back();
            },
            title: 'ملاحظة',
            mainContent: 'هل انت متاكد من حذف العنوان',
            onConfirm: () =>
                BlocProvider.of<AddressCubit>(context, listen: false)
                    .deleteAddress(id: address!.id!, address: address!),
          );
        },
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
        child: AddressContainer(
          address: address!,
          fromRoute: fromRoute,
          isWithPrimary: true,
          isPrimary: isPrimary!,
          index: index,
        ));
  }
}

class AddressContainer extends StatelessWidget {
  final Address address;
  final int? index;
  final bool isWithPrimary;
  final bool isPrimary;
  final String fromRoute;
  const AddressContainer(
      {super.key,
      required this.address,
      required this.fromRoute,
      this.index,
      required this.isWithPrimary,
      required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kDefaultBoxDecoration.copyWith(
          border: Border.all(color: Colors.transparent)),
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
                  address.fullAddress!.split('%')[0],
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
                  '${address.fullAddress!.split('%')[1]},${address.zone},${address.fullAddress!.split('%')[3]}',
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
              '  ${address.fullAddress!.split('%')[0]},${address.fullAddress!.split('%')[1]},${address.fullAddress!.split('%')[2]}',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
            ),
            mediumVerticalSpace,
            Text(
              '  رقم المبني ${address.buildingNo}، رقم الدور ${address.floor}, رقم الشقة ${address.apartmentNo}',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
            ),
            mediumVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isWithPrimary
                    ? InkWell(
                        onTap: () {
                          BlocProvider.of<AddressCubit>(context)
                              .setIsPrimary(index!);
                          getIt<AddressService>().setPrimaryAddress(address);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.w,
                              decoration: BoxDecoration(
                                  color: isPrimary
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
                                      color: AppColorsLight
                                          .kAppPrimaryColorLight
                                          .withOpacity(0.7)),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                InkWell(
                  onTap: () {
                    if (fromRoute == RouteHelper.getCartRoute()) {
                      Get.toNamed(RouteHelper.getAddressesRoute(),
                          arguments: RouteHelper
                              .getCartRoute()); // navigate addresses page
                    } else {
                      // navigate to edit address page
                      Get.toNamed(RouteHelper.getUpdateAddress(), arguments: [
                        true,
                        address,
                        RouteHelper.getAddressesRoute()
                      ]);
                    }
                  },
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    );
  }
}

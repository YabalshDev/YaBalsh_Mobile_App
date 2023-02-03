import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/date_time_utils.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../blocs/cubit/store_details_cubit.dart';

class BranchAddressDetails extends StatelessWidget {
  const BranchAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 52.h,
              child: Row(
                children: [
                  const BranchDetailsType(
                    branchDetailsType: 'المنطقة',
                    iconPath: AppAssets.addressesIcon,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      state.store!.location!.address!.split('-')[0],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColorsLight.kDisabledButtonTextColor),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColorsLight.kDisabledButtonTextColor.withOpacity(0.6),
              thickness: 0.6,
            ),
            SizedBox(
              height: 52.h,
              child: Row(
                children: [
                  const BranchDetailsType(
                    branchDetailsType: 'عنوان الفرع',
                    iconPath: AppAssets.storeMapIcon,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      state.store!.location!.address!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColorsLight.kDisabledButtonTextColor),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: AppColorsLight.kDisabledButtonTextColor.withOpacity(0.6),
              thickness: 0.6,
            ),
            SizedBox(
              height: 52.h,
              child: Row(
                children: [
                  const BranchDetailsType(
                    branchDetailsType: 'ساعات العمل',
                    iconPath: AppAssets.earthIcon,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      getOpeningHours(state.store!.location!.startTime!,
                          state.store!.location!.endTime!),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColorsLight.kDisabledButtonTextColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class BranchDetailsType extends StatelessWidget {
  final String iconPath;
  final String branchDetailsType;
  const BranchDetailsType({
    Key? key,
    required this.iconPath,
    required this.branchDetailsType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgIcon(
          iconPath: iconPath,
          height: 20.h,
        ),
        smallHorizontalSpace,
        Text(
          branchDetailsType,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

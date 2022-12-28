import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';

class DeliveryDetailsSection extends StatelessWidget {
  const DeliveryDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'التوصيل'),
        mediumHorizontalSpace,
        mediumHorizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallVerticalSpace,
            Text(
              'عنوان التوصيل',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: Get.width * 0.5),
              child: Text(
                '${getIt<CartCubit>().state.userAddress!.fullAddress}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color:
                        AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
              ),
            ),
            Text(
              'رقم المبني ${getIt<CartCubit>().state.userAddress!.buildingNo}، رقم الدور ${getIt<CartCubit>().state.userAddress!.floor}, رقم الشقة ${getIt<CartCubit>().state.userAddress!.apartmentNo}',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
            ),
          ],
        )
      ],
    );
  }
}

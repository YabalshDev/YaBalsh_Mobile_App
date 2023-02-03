import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ProductNotificationRing extends StatelessWidget {
  const ProductNotificationRing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          previous.isProductNotified != current.isProductNotified,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => BlocProvider.of<ProductDetailsCubit>(context)
              .changeProductNotified(!state.isProductNotified!),
          child: Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                color: state.isProductNotified!
                    ? Colors.green.shade500
                    : AppColorsLight.kAppPrimaryColorLight,
                borderRadius: BorderRadius.circular(12.r)),
            child: CustomSvgIcon(
              iconPath: AppAssets.notificationIcon,
              width: 25.w,
              height: 25.h,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

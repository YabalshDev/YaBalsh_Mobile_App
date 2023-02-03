import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../home/domain/entities/product.dart';
import '../blocs/cubit/product_details_cubit.dart';

class VariantCard extends StatelessWidget {
  const VariantCard({
    Key? key,
    required this.variant,
    required this.index,
  }) : super(key: key);

  final Product variant;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (variant.prices!.isEmpty) {
      return const SizedBox();
    } else {
      return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        buildWhen: (previous, current) =>
            previous.selectedVariantIndex != current.selectedVariantIndex,
        builder: (context, state) {
          return InkWell(
            onTap: () => BlocProvider.of<ProductDetailsCubit>(context)
                .selectVariant(index, variant),
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              padding: EdgeInsets.fromLTRB(10.w, 6.h, 1.w, 7.h),
              decoration: kDefaultBoxDecoration.copyWith(
                  border: state.selectedVariantIndex == index
                      ? Border.all(
                          color: AppColorsLight.kAppPrimaryColorLight, width: 2)
                      : null),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 45.h,
                        width: 43.w,
                        child: AppImage(
                          path: variant.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                      smallHorizontalSpace,
                      Container(
                        constraints: BoxConstraints(maxWidth: 70.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              variant.name!.split('-')[1],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          AppColorsLight.kAppPrimaryColorLight),
                            ),
                            smallVerticalSpace,
                            Text(
                              "جنيه  ${variant.prices!.entries.first.value.price}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.sp,
                                      color:
                                          AppColorsLight.kAppPrimaryColorLight),
                            ),
                          ],
                        ),
                      ),
                      smallHorizontalSpace,
                      SizedBox(
                        height: 17.h,
                        width: 48.w,
                        child: AppImage(
                          path: variant
                              .prices!.entries.first.value.storeImagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

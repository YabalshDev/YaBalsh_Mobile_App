import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/responsive_text.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../home/domain/entities/product.dart';
import '../blocs/cubit/recipie_details_cubit.dart';

class RecipieProductsSection extends StatelessWidget {
  const RecipieProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipieDetailsCubit, RecipieDetailsState>(
      builder: (context, state) {
        switch (state.recipieRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return ListView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              padding: kDefaultPadding,
              itemBuilder: (context, index) {
                return CustomShimmer(
                  height: 80.h,
                  width: Get.width,
                );
              },
            );

          case RequestState.loaded:
            return CustomAnimatedWidget(
              child: ListView.builder(
                itemCount: state.recipie!.products!.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: kDefaultPadding,
                itemBuilder: (context, index) {
                  final product = state.recipie!.products![index];
                  return RecipieProductCard(
                    product: product,
                  );
                },
              ),
            );

          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class RecipieProductCard extends StatelessWidget {
  final Product product;
  const RecipieProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCard(
            width: 53.w,
            height: 53.h,
            withBorder: true,
            isAssetImage: false,
            imagePath: product.imagePath,
          ),
          mediumHorizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 180.w),
                child: ResponsiveText(
                  title: product.name!,
                  truncateTextLength: 10,
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColorsLight.kAppPrimaryColorLight,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              mediumVerticalSpace,
              Text(
                product.size!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 9.sp,
                    color: AppColorsLight.kAppPrimaryColorLight,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 95.w,
            child: Text(
              '${product.prices!.entries.first.value.price} جنيه',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                  color: AppColorsLight.kAppPrimaryColorLight),
            ),
          )
        ],
      ),
    );
  }
}

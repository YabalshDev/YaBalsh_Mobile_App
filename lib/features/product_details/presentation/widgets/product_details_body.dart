import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../../../../core/widgets/empty_indicator.dart';
import 'popular_products_section.dart';
import 'product_details_section.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
              ),
              const ProductDetailsSection(),
              const ProductVariantsSection(),
              const PopularProductsSection()
            ],
          ),
        ),
      ),
    );
  }
}

class ProductVariantsSection extends StatelessWidget {
  const ProductVariantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          previous.productVariationRequestState !=
          current.productVariationRequestState,
      builder: (context, state) {
        switch (state.productVariationRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return SizedBox(
                height: 80.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CustomShimmer(
                      width: 145.w,
                      height: 45.h,
                    );
                  },
                ));

          case RequestState.loaded:
            return state.productVaraiations!.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubHeading(text: 'احجام اخرى للمنتج'),
                      mediumVerticalSpace,
                      SizedBox(
                        height: 63.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.productVaraiations!.length,
                          itemBuilder: (context, index) {
                            final variant = state.productVaraiations![index];
                            return VariantCard(
                              variant: variant,
                              index: index,
                            );
                          },
                        ),
                      ),
                      mediumVerticalSpace
                    ],
                  );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: EmptyIndicator(title: 'مشكلة في جلب المنتج '),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

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
                      height: 35.h,
                      width: 32.w,
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
                        children: [
                          Text(
                            variant.name!.split('-')[1],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        AppColorsLight.kAppPrimaryColorLight),
                          ),
                          Text(
                            "جنيه ${variant.prices!.entries.first.value.price}",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp,
                                    color:
                                        AppColorsLight.kAppPrimaryColorLight),
                          ),
                        ],
                      ),
                    ),
                    smallHorizontalSpace,
                    SizedBox(
                      height: 24.h,
                      width: 44.w,
                      child: AppImage(
                        path:
                            variant.prices!.entries.first.value.storeImagePath,
                        fit: BoxFit.fill,
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

class NearYouSection extends StatelessWidget {
  const NearYouSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              'القريب منك',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: state.withNearStores!
                      ? Colors.green.shade400
                      : Colors.grey.shade300),
            ),
            Platform.isAndroid
                ? Switch(
                    value: state.withNearStores!,
                    activeColor: Colors.green.shade400,
                    onChanged: (value) =>
                        BlocProvider.of<ProductDetailsCubit>(context)
                            .changeWithNearStores(value),
                  )
                : CupertinoSwitch(
                    value: state.withNearStores!,
                    activeColor: Colors.green.shade400,
                    onChanged: (value) =>
                        BlocProvider.of<ProductDetailsCubit>(context)
                            .changeWithNearStores(value),
                  )
          ],
        );
      },
    );
  }
}

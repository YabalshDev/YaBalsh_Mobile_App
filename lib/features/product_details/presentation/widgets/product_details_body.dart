import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/kew_word_products.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/Title_row.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import 'price_comparison_section.dart';
import 'product_image_card.dart';
import 'product_kewords_card.dart';

class ProductDetailsBody extends StatelessWidget {
  final Product product;
  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
              child: Padding(
                padding: kDefaultPadding,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                ),
              ),
            ),
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              buildWhen: (previous, current) =>
                  previous.productRequestState != current.productRequestState,
              builder: (context, state) {
                switch (state.productRequestState) {
                  case RequestState.idle:
                    return const SizedBox();
                  case RequestState.loading:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CustomShimmer(
                            height: 196.h,
                            width: 164.w,
                          ),
                        ),
                        smallVerticalSpace,
                        CustomShimmer(
                          height: 20.h,
                          width: Get.width,
                        ),
                        smallVerticalSpace,
                        const ProductKewordsSectionLoading(),
                        mediumVerticalSpace,
                        const PriceComparisonSectionLoading(),
                        mediumVerticalSpace,
                      ],
                    );

                  case RequestState.loaded:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImageCard(imagePath: product.imagePath!),
                        Text(
                          product.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight,
                                  fontWeight: FontWeight.w700),
                        ),
                        smallVerticalSpace,
                        ProductKewordCards(productName: product.name!),
                        mediumVerticalSpace,
                        Row(
                          children: [
                            Text(
                              AppStrings.discoverComparePrices,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const NearYouSection()
                          ],
                        ),
                        PriceComparisonSection(product: product),
                        mediumVerticalSpace,
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
            ),

            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                switch (state.popularProductsRequestState) {
                  case RequestState.idle:
                    return const SizedBox();

                  case RequestState.loading:
                    return SizedBox(
                        height: 280.h, child: const SimillarProductsLoading());
                  case RequestState.loaded:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleRow(
                          title: 'ممكن كمان يعجبك',
                          fontWeight: FontWeight.w800,
                          padding: kDefaultPadding.copyWith(right: 2.w),
                        ),
                        mediumVerticalSpace,
                        SizedBox(
                            height: 280.h,
                            child: KewordProducts(
                                products: state.popularProducts!))
                      ],
                    );
                  case RequestState.error:
                    return const SizedBox();

                  default:
                    return const SizedBox();
                }
              },
            )

            // KewordSection(order: order)
          ],
        ),
      ),
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

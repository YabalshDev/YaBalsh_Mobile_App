import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/product_loading_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/search_product_card.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/back_to_top_card.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_error_indicator.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_no_results.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';

class ProductsSearchSection extends StatefulWidget {
  const ProductsSearchSection({super.key});

  @override
  State<ProductsSearchSection> createState() => _ProductsSearchSectionState();
}

class _ProductsSearchSectionState extends State<ProductsSearchSection> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  switch (state.searchProductsRequestState) {
                    case RequestState.idle:
                      return const SizedBox();
                    case RequestState.loading:
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.w,
                            crossAxisSpacing: 5.h,
                            childAspectRatio: 133.w / 144.h),
                        itemBuilder: (context, index) {
                          return const ProductLoadingShimmer();
                        },
                      );
                    case RequestState.loaded:
                      return state.searchProductsResult!.isEmpty
                          ? SizedBox(
                              height: Get.height * 0.6,
                              child: const SearchEmptyResult())
                          : Padding(
                              padding: kDefaultPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const SubHeading(text: 'المنتجات'),
                                      smallHorizontalSpace,
                                      Text(
                                        '(${state.searchProductsResult!.length} نتائج)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: AppColorsLight
                                                    .kAppPrimaryColorLight),
                                      )
                                    ],
                                  ),
                                  mediumVerticalSpace,
                                  Wrap(
                                    direction: Axis.horizontal,
                                    runSpacing: 10.h,
                                    children: state.searchProductsResult!
                                        .map((product) {
                                      return BlocProvider.value(
                                        value: getIt<CartCubit>(),
                                        child:
                                            SearchProductCard(product: product),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                            );
                    case RequestState.error:
                      return SizedBox(
                          height: Get.height * 0.6,
                          child: const SearchErrorIndicator());

                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
        // back to top
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.searchProductsResult!.isNotEmpty &&
                    state.searchProductsRequestState == RequestState.loaded
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BackToTopCard(
                            scrollController: _scrollController!)),
                  )
                : const Positioned(
                    child: SizedBox(),
                  );
          },
        )
      ],
    );
  }
}

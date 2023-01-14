import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';
import '../../../home/presentation/widgets/main_product_card.dart';
import '../blocs/cubit/search_cubit.dart';
import 'search_error_indicator.dart';
import 'search_no_results.dart';
import 'search_products_loading.dart';

class ProductSearchResult extends StatelessWidget {
  const ProductSearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state.searchProductsRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const SearchProductsLoading();
          case RequestState.loaded:
            return state.searchProductsResult!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.6, child: const SearchEmptyResult())
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
                                      color:
                                          AppColorsLight.kAppPrimaryColorLight),
                            )
                          ],
                        ),
                        mediumVerticalSpace,
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 10.h,
                          children: state.searchProductsResult!.map((product) {
                            return BlocProvider.value(
                              value: getIt<CartCubit>(),
                              child: MainProductCard(product: product),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  );
          case RequestState.error:
            return SizedBox(
                height: Get.height * 0.6, child: const SearchErrorIndicator());

          default:
            return const SizedBox();
        }
      },
    );
  }
}

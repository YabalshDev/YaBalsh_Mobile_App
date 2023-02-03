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
      buildWhen: (previous, current) =>
          previous.searchProductsRequestState !=
          current.searchProductsRequestState,
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
                : const SearchProductResultsLoaded();
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

class SearchProductResultsLoaded extends StatelessWidget {
  const SearchProductResultsLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.chepeastProduct!.id != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeading(text: 'افضل عرض على ${state.intialValue}'),
                        mediumVerticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: MainProductCard(
                              product: state.chepeastProduct!,
                              fromSearch: true),
                        ),
                        mediumVerticalSpace
                      ],
                    )
                  : const SizedBox(),
              Row(
                children: [
                  const SubHeading(text: 'المنتجات'),
                  smallHorizontalSpace,
                  Text(
                    '(${state.chepeastProduct!.id != null ? state.searchProductsResult!.length - 1 : state.searchProductsResult!.length} نتائج)',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
                  )
                ],
              ),
              mediumVerticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 21.h,
                  spacing: 21.w,
                  alignment: WrapAlignment.start,
                  children: state.chepeastProduct!.id != null
                      ? state.searchProductsResult!
                          .where((element) =>
                              element.id != state.chepeastProduct!.id)
                          .toList()
                          .map((product) {
                          return BlocProvider.value(
                            value: getIt<CartCubit>(),
                            child: MainProductCard(
                                product: product, fromSearch: true),
                          );
                        }).toList()
                      : state.searchProductsResult!.map((product) {
                          return BlocProvider.value(
                            value: getIt<CartCubit>(),
                            child: MainProductCard(
                                product: product, fromSearch: true),
                          );
                        }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

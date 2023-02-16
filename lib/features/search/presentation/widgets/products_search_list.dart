import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';
import '../../../home/presentation/widgets/main_product_card.dart';
import '../blocs/cubit/search_cubit.dart';

class ProductsSearchList extends StatelessWidget {
  const ProductsSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ),
            state.paginationLoading!
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : const SizedBox(),
            largeVerticalSpace,
          ],
        );
      },
    );
  }
}

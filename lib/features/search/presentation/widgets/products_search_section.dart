import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/product_loading_shimmer.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_product_card_test.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';

class ProductsSearchSection extends StatelessWidget {
  const ProductsSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.searchProductsResult!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.w,
                        crossAxisSpacing: 5.h,
                        childAspectRatio: 133.w / 215.h),
                    itemBuilder: (context, index) {
                      final product = state.searchProductsResult![index];
                      return BlocProvider.value(
                        value: getIt<CartCubit>(),
                        child: HomeProductCardTest(product: product),
                      );
                    },
                  );
                case RequestState.error:
                  return SizedBox(
                      height: Get.height * 0.6,
                      child: const EmptyIndicator(
                          title: 'خطا اثناء البحث حاول مرة اخرى'));

                default:
                  return const SizedBox();
              }
            },
          ),
          SizedBox(
            height: Get.height * 0.6,
            child: const Center(
              child: Text('المنتجات'),
            ),
          ),
        ],
      ),
    );
  }
}

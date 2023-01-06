import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/kew_word_products.dart';
import '../../../home/presentation/widgets/Title_row.dart';
import '../blocs/cubit/product_details_cubit.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
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
                    height: 290.h,
                    child: KewordProducts(products: state.popularProducts!))
              ],
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/kew_word_products.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../blocs/cubit/search_cubit.dart';
import 'search_products_loading.dart';

class MostSellingProdutsSection extends StatelessWidget {
  const MostSellingProdutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state.isSearchEmpty!) {
        switch (state.mostSellingRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const SearchProductsLoading();
          case RequestState.loaded:
            return state.mostSellingProducts!.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: kDefaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubHeading(text: 'المنتجات الاكثر مبيعا'),
                        mediumVerticalSpace,
                        SizedBox(
                            height: 305.h,
                            child: KewordProducts(
                                products: state.mostSellingProducts!))
                      ],
                    ),
                  );
          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      } else {
        return const SizedBox();
      }
    });
  }
}

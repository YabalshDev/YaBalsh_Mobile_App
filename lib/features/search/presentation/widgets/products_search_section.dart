import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';

class ProductsSearchSection extends StatelessWidget {
  const ProductsSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchHistorySection(),
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

class SearchHistorySection extends StatelessWidget {
  const SearchHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state.searchHistoryRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeading(text: 'ما بحثت عنه مؤخرا'),
                mediumVerticalSpace,
                Row(
                    children: List.generate(
                        3,
                        (index) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade600,
                            child: Container(
                                width: 57.w,
                                height: 25.h,
                                margin: EdgeInsets.only(left: 10.w),
                                decoration: kDefaultBoxDecoration.copyWith(
                                    borderRadius: kSecondaryBorderRaduis,
                                    color: Colors.amber)))))
              ],
            );
          case RequestState.loaded:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeading(text: 'ما بحثت عنه مؤخرا'),
                mediumVerticalSpace,
                Wrap(
                    children: state.searchHistory!
                        .map((name) => Container(
                              decoration: kDefaultBoxDecoration,
                              padding: kDefaultPadding,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CustomSvgIcon(
                                      iconPath: AppAssets.historyIcon),
                                  smallHorizontalSpace,
                                  Text(name)
                                ],
                              ),
                            ))
                        .toList())
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

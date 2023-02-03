import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/super_market_search_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../blocs/cubit/search_cubit.dart';
import 'search_error_indicator.dart';
import 'search_no_results.dart';

class SuperMarketsSearchResult extends StatelessWidget {
  final SearchState state;
  const SuperMarketsSearchResult({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.searchStoresRequestState) {
      case RequestState.idle:
        return const SizedBox();

      case RequestState.loading:
        return ListView.builder(
          itemCount: 3,
          padding: kDefaultPadding,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomShimmer(
            height: 84.h,
            width: Get.width,
          ),
        );
      case RequestState.loaded:
        return state.searchStoresResult!.isEmpty
            ? SizedBox(
                height: Get.height * 0.6, child: const SearchEmptyResult())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Row(
                      children: [
                        const SubHeading(text: 'السوبر ماركتس'),
                        smallHorizontalSpace,
                        Text(
                          '(${state.searchStoresResult!.length} نتائج)',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight),
                        )
                      ],
                    ),
                  ),
                  mediumVerticalSpace,
                  Container(
                    color: AppColorsLight.kDisabledButtonColor,
                    child: Column(
                      children: [
                        ListView.builder(
                            itemCount: state.searchStoresResult!.length,
                            padding: kDefaultPadding,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final store = state.searchStoresResult![index];
                              return SuperMarketSearchCard(store: store);
                            }),
                        SizedBox(
                          height: Get.height,
                        )
                      ],
                    ),
                  ),
                ],
              );

      case RequestState.error:
        return SizedBox(
            height: Get.height * 0.6, child: const SearchErrorIndicator());

      default:
        return const SizedBox();
    }
  }
}

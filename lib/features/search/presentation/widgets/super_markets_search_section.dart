import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/near_stores_list.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/back_to_top_card.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_error_indicator.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_no_results.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/super_market_search_card.dart';

import '../../../../core/services/stores_service.dart';
import '../../../../core/utils/enums/request_state.dart';

class SuperMarketsSearchSection extends StatefulWidget {
  const SuperMarketsSearchSection({super.key});

  @override
  State<SuperMarketsSearchSection> createState() =>
      _SuperMarketsSearchSectionState();
}

class _SuperMarketsSearchSectionState extends State<SuperMarketsSearchSection> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
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
                  if (state.isSearchEmpty!) {
                    return Padding(
                      padding: kDefaultPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SubHeading(text: 'السوبر ماركتس القريبة منك'),
                          mediumVerticalSpace,
                          NearStoresList(
                              stores: getIt<StoreService>().nearStores,
                              isWithPadding: false),
                        ],
                      ),
                    );
                  } else {
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
                            widht: Get.width,
                          ),
                        );
                      case RequestState.loaded:
                        return state.searchStoresResult!.isEmpty
                            ? SizedBox(
                                height: Get.height * 0.6,
                                child: const SearchEmptyResult())
                            : Container(
                                color: AppColorsLight.kDisabledButtonColor,
                                child: Column(
                                  children: [
                                    ListView.builder(
                                        itemCount:
                                            state.searchStoresResult!.length,
                                        padding: kDefaultPadding,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final store =
                                              state.searchStoresResult![index];
                                          return SuperMarketSearchCard(
                                              store: store);
                                        }),
                                    SizedBox(
                                      height: Get.height,
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
                  }
                },
              )
            ],
          ),
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.searchStoresResult!.isEmpty
                ? const Positioned(child: SizedBox())
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BackToTopCard(
                            scrollController: _scrollController!)),
                  );
          },
        )
      ],
    );
  }
}

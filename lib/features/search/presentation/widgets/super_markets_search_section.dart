import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/near_stores_list.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../../../../core/services/stores_service.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/empty_indicator.dart';

class SuperMarketsSearchSection extends StatelessWidget {
  const SuperMarketsSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state.isSearchEmpty!) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubHeading(text: 'السوبر ماركتس القريبة منك'),
                    mediumVerticalSpace,
                    NearStoresList(
                        stores: getIt<StoreService>().nearStores,
                        isWithPadding: false),
                  ],
                );
              } else {
                switch (state.searchStoresRequestState) {
                  case RequestState.idle:
                    return const SizedBox();

                  case RequestState.loading:
                    return ListView.builder(
                      itemCount: 3,
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
                            child: const Center(
                              child: EmptyIndicator(title: 'لا يوجد نتائج بحث'),
                            ))
                        : ListView.builder(
                            itemCount: state.searchStoresResult!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final store = state.searchStoresResult![index];
                              return Container(
                                margin: EdgeInsets.only(top: 10.h),
                                height: 100.h,
                                decoration: kDefaultBoxDecoration.copyWith(
                                    color: Colors.amber,
                                    border:
                                        Border.all(color: Colors.transparent)),
                              );
                            });

                  case RequestState.error:
                    return SizedBox(
                        height: Get.height * 0.6,
                        child: const Center(
                          child: EmptyIndicator(
                              title: 'خطا اثناء البحث حاول مرة اخرى'),
                        ));

                  default:
                    return const SizedBox();
                }
              }
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/super_market_card.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/super_markets_cubit.dart';

class SuperMarketLists extends StatelessWidget {
  const SuperMarketLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperMarketsCubit, SuperMarketsState>(
      builder: (context, state) {
        switch (state.storeRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(child: CircularProgressIndicator()),
            );

          case RequestState.loaded:
            final unAvailableMarkets = state.superMarkets!
                .where((element) => element.isAvailable == false)
                .toList();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إختار السوبر ماركت',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),
                  largeVerticalSpace,
                  ListView.builder(
                    key: UniqueKey(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.superMarkets!
                        .where((element) => element.isAvailable!)
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      final superMarket = state.superMarkets![index];

                      return SuperMarketCard(
                          superMarket: superMarket,
                          isAvailable: superMarket.isAvailable!,
                          index: index,
                          selectedSupermarketIndex:
                              state.selectedSupermarketIndex!);
                    },
                  ),
                  largeVerticalSpace,
                  unAvailableMarkets.isEmpty
                      ? const SizedBox()
                      : Row(
                          children: [
                            const CustomSvgIcon(
                              iconPath: AppAssets.notAvailable,
                              color: AppColorsLight.kErrorColor,
                            ),
                            smallHorizontalSpace,
                            Text(
                              'بعض المنتجات غير متوفرة',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    color: AppColorsLight.kErrorColor,
                                  ),
                            ),
                          ],
                        ),
                  ListView.builder(
                    key: UniqueKey(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: unAvailableMarkets.length,
                    itemBuilder: (context, index) {
                      final superMarket = unAvailableMarkets[index];

                      return SuperMarketCard(
                          superMarket: superMarket,
                          isAvailable: superMarket.isAvailable!,
                          index: index,
                          selectedSupermarketIndex:
                              state.selectedSupermarketIndex!);
                    },
                  ),
                ],
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: Text('خطا'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

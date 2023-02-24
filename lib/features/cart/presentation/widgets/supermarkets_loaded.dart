import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/empty_states.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/super_markets_cubit.dart';
import 'super_market_card.dart';

class SuperMarketsLoaded extends StatelessWidget {
  const SuperMarketsLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperMarketsCubit, SuperMarketsState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: getIt<AppSettingsService>().appVersion == '1.0.0'
                  ? kDefaultPadding
                  : EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.availableSupermarkets!.isEmpty
                      ? SizedBox(
                          height:
                              getIt<AppSettingsService>().appVersion == '1.0.0'
                                  ? Get.height
                                  : Get.height * 0.6,
                          child: const Center(
                            child: EmptyIndicator(
                                emptyStateType: EmptyStates.cart,
                                title: 'لا يوجد سوبرماركتس لطلب المنتجات'),
                          ),
                        )
                      : Text(
                          getIt<AppSettingsService>().appVersion != '1.0.0'
                              ? 'إختار السوبر ماركت'
                              : 'السوبر ماركتس المتوفرة',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 18.sp),
                        ),
                  largeVerticalSpace,
                  ListView.builder(
                    key: UniqueKey(),
                    padding: EdgeInsets.only(left: 5.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.availableSupermarkets!.length,
                    itemBuilder: (context, index) {
                      final superMarket = state.availableSupermarkets![index];

                      return SuperMarketCard(
                          superMarket: superMarket,
                          isAvailable: superMarket.isAvailable!,
                          index: index,
                          selectedSupermarketIndex:
                              state.selectedSupermarketIndex!);
                    },
                  ),
                  largeVerticalSpace,
                  state.unAvailableSupermarkets!.isEmpty
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
                    padding: EdgeInsets.only(left: 5.w),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.unAvailableSupermarkets!.length,
                    itemBuilder: (context, index) {
                      final superMarket = state.unAvailableSupermarkets![index];

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
            ),
          ),
        );
      },
    );
  }
}

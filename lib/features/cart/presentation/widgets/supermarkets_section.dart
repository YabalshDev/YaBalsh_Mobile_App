import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/super_markets_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import 'super_market_card.dart';

class SupermarketsSection extends StatelessWidget {
  const SupermarketsSection({super.key, required this.isAvailableMarkets});
  final bool isAvailableMarkets;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperMarketsCubit, SuperMarketsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isAvailableMarkets
                ? Text(
                    getIt<AppSettingsService>().appConfig.appVersion != '1.0.0'
                        ? 'إختار السوبر ماركت'
                        : 'السوبر ماركتس المتوفرة',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 18.sp),
                  )
                : Row(
                    children: [
                      const CustomSvgIcon(
                        iconPath: AppAssets.notAvailable,
                        color: AppColorsLight.kErrorColor,
                      ),
                      smallHorizontalSpace,
                      Text(
                        'بعض المنتجات غير متوفرة',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: AppColorsLight.kErrorColor,
                            ),
                      ),
                    ],
                  ),
            smallVerticalSpace,
            ListView.builder(
              key: UniqueKey(),
              padding: EdgeInsets.only(left: 5.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isAvailableMarkets
                  ? state.availableSupermarkets!.length
                  : state.unAvailableSupermarkets!.length,
              itemBuilder: (context, index) {
                final superMarket = isAvailableMarkets
                    ? state.availableSupermarkets![index]
                    : state.unAvailableSupermarkets![index];

                return SuperMarketCard(
                    superMarket: superMarket,
                    isAvailable: superMarket.isAvailable!,
                    index: index,
                    selectedSupermarketIndex: state.selectedSupermarketIndex!);
              },
            ),
            largeVerticalSpace,
          ],
        );
      },
    );
  }
}

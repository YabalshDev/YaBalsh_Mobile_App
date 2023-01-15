import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/home/data/models/location_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/location.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../home/domain/entities/store.dart';
import '../../domain/entities/supermarket_card_model.dart';

class SupermarketDetailsCard extends StatelessWidget {
  final SuperMarketCardModel? superMarketCardModel;
  final Store? store;
  final bool? isFromOrderSuccess;
  const SupermarketDetailsCard(
      {super.key,
      this.superMarketCardModel,
      this.isFromOrderSuccess = false,
      this.store});

  @override
  Widget build(BuildContext context) {
    Location? storeLocation;
    if (store != null) {
      storeLocation = store!.locations!.firstWhere(
        (element) =>
            element.subZoneId == getIt<ZoneService>().currentSubZone!.id,
        orElse: () => const LocationModel(),
      );
    } else {
      storeLocation = superMarketCardModel!.store!.locations!.firstWhere(
        (element) =>
            element.subZoneId == getIt<ZoneService>().currentSubZone!.id,
        orElse: () => const LocationModel(),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          withBorder: true,
          isAssetImage: false,
          imagePath: superMarketCardModel != null
              ? superMarketCardModel!.store!.cardImagePath
              : store!.cardImagePath,
        ),
        smallHorizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'طلبك من  ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black, fontSize: 10.sp)),
                TextSpan(
                    text: superMarketCardModel != null
                        ? superMarketCardModel!.store!.name
                        : store!.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp)),
              ]),
            ),
            mediumVerticalSpace,
            Row(
              children: [
                CustomSvgIcon(
                  iconPath: AppAssets.truckIcon,
                  height: 15.h,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
                Text(
                  isFromOrderSuccess!
                      ? '${superMarketCardModel != null ? superMarketCardModel!.store!.name : store!.name} هيوصلك طلبك في الوقت المتوقع'
                      : 'الطلب هيتم توصيله في خلال ${storeLocation.deliveryTime} دقيقة',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          AppColorsLight.kAppPrimaryColorLight.withOpacity(0.8),
                      fontSize: 9.sp),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

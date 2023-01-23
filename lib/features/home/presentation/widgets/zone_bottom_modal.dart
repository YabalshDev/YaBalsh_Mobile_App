import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/handle_zone_history_selection.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/zone_history_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/light/app_colors_light.dart';

class ZonesBottomModal extends StatelessWidget {
  final List<SubZone> zones;
  const ZonesBottomModal({super.key, required this.zones});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: SizedBox(
        height: Get.height * 0.35,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 35.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColorsLight.kDisabledButtonTextColor,
                  ),
                ),
              ),
              largeVerticalSpace,
              Container(
                padding: kDefaultPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'اختار موقعك',
                      style: Get.theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        color: AppColorsLight.kAppPrimaryColorLight,
                      ),
                    )
                  ],
                ),
              ),
              smallVerticalSpace,
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              mediumVerticalSpace,
              zones.isEmpty
                  ? const Text('لا يوجد مناطق ')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'آخر المناطق الي اخترتها',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 13.sp, color: Colors.grey),
                        ),
                        smallVerticalSpace,
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: zones.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final subZone = zones[index];
                            return InkWell(
                                onTap: () {
                                  handleOnZoneHistorySelection(subZone);
                                },
                                child: ZoneHistoryCard(subZone: subZone));
                          },
                        ),
                      ],
                    ),
              largeVerticalSpace,
              InkWell(
                onTap: () => Get.offAllNamed(RouteHelper.getMainZonesRoute()),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColorsLight.kAppPrimaryColorLight,
                    ),
                    Text(
                      'اختار منطقة تانية',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

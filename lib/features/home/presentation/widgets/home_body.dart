import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/banners_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_header.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_sections.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/last_offers_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/near_stores_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/search_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/welcome_section.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (getIt<ZoneService>().currentSubZone!.name!.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ErrorIndicator(
              errorMessage: 'لا يوجد منطقة مختارة..برجاء اختيار منطقة '),
          mediumVerticalSpace,
          Padding(
            padding: kDefaultPadding,
            child: YaBalashCustomButton(
              child: const Text('اختيار منطقة'),
              onTap: () => Get.offNamed(RouteHelper.getMainZonesRoute()),
            ),
          )
        ],
      );
    } else {
      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: HomeHeader()),
          const SliverToBoxAdapter(child: WelcomeSection()),
          SliverToBoxAdapter(child: mediumVerticalSpace),
          const SliverToBoxAdapter(child: SearchSection()),
          SliverToBoxAdapter(child: mediumVerticalSpace),
          const SliverToBoxAdapter(child: LastOfferSection()),
          const SliverToBoxAdapter(child: BannersSection()),
          SliverToBoxAdapter(child: mediumVerticalSpace),
          const SliverToBoxAdapter(child: NearStoresSection()),
          const SliverToBoxAdapter(child: HomeSections()),
          SliverToBoxAdapter(child: mediumVerticalSpace),
        ],
      );
    }
  }
}

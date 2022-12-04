import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/banner_mock_data.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/Title_row.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/banners_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_header.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/keword_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/last_offers_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/near_stores_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/search_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/welcome_section.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/constants/constantdata/sections_mock_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: HomeHeader()),
        const SliverToBoxAdapter(child: WelcomeSection()),
        const SliverToBoxAdapter(child: SearchSection()),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 5.h,
        )),
        const SliverToBoxAdapter(child: TitleRow(title: 'اكتشف ارخص العروض')),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 5.h,
        )),
        const SliverToBoxAdapter(child: LastOfferSection()),
        SliverToBoxAdapter(child: BannersSection()),
        const SliverToBoxAdapter(
            child: TitleRow(title: 'السوبر ماركتس القريبة منك  🏠')),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 5.h,
        )),
        const SliverToBoxAdapter(child: NearStoresSection()),
        SliverToBoxAdapter(
            child: KewordSection(
          section: sectionsMock[0],
        )),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 10.h,
        )),
        SliverToBoxAdapter(
            child: KewordSection(
          section: sectionsMock[0],
        )),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 10.h,
        )),
        SliverToBoxAdapter(
            child: ClipRRect(
          borderRadius: kDefaultBorderRaduis,
          child: Image.asset(
            bannersMockData[0].imagePath!,
          ),
        )),
      ],
    );
  }
}

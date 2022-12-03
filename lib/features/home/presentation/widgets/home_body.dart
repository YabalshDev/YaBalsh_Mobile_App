import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/Title_row.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_header.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/search_section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/welcome_section.dart';

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
      ],
    );
  }
}

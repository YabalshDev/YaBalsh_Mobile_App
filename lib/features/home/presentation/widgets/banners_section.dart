import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/widgets/dots_indicators.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/constants/constantdata/banner_mock_data.dart';

class BannersSection extends StatelessWidget {
  BannersSection({super.key});
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeIn(
          duration: const Duration(milliseconds: 500),
          child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: bannersMockData.length,
              itemBuilder: (context, index, realIndex) {
                final banner = bannersMockData[0];
                return ClipRRect(
                  borderRadius: kDefaultBorderRaduis,
                  child: Image.asset(
                    banner.imagePath!,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1, autoPlay: true, height: 133.h)),
        ),
        SizedBox(
          height: 5.h,
        ),
        DotsIndicatorsCards(index: 0, length: bannersMockData.length)
      ],
    );
  }
}

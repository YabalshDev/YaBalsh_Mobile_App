import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../on_boaring/presentation/widgets/dots_indicators.dart';
import '../blocs/cubit/home_cubit.dart';

class BannersSection extends StatelessWidget {
  BannersSection({super.key});
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        print(state);
        switch (state.bannersRequestState) {
          case RequestState.loading:
            return SizedBox(
              height: 133.h,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[800]!,
                highlightColor: Colors.grey[850]!,
                child: ClipRRect(
                  borderRadius: kDefaultBorderRaduis,
                ),
              ),
            );

          case RequestState.loaded:
            return Column(
              children: [
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: CarouselSlider.builder(
                      carouselController: carouselController,
                      itemCount: state.banners!.length,
                      itemBuilder: (context, index, realIndex) {
                        final banner = state.banners![index];
                        return ClipRRect(
                          borderRadius: kDefaultBorderRaduis,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Image.asset(
                              banner.imagePath!,
                              width: Get.size.width * 0.9,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          onPageChanged: (index, reason) =>
                              BlocProvider.of<HomeCubit>(context)
                                  .onBannerChanged(index),
                          viewportFraction: 0.94,
                          autoPlay: false,
                          height: 150.h)),
                ),
                mediumVerticalSpace,
                DotsIndicatorsCards(
                    index: state.currentBannerIndex!,
                    length: state.banners!.length)
              ],
            );

          case RequestState.error:
            return SizedBox(
              height: 133.h,
              child: Center(
                child: Text(state.bannersError!),
              ),
            );

          default:
            return SizedBox(
              height: 133.h,
            );
        }
      },
    );
  }
}

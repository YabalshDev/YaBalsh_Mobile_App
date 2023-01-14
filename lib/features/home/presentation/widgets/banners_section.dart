import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../on_boaring/presentation/widgets/dots_indicators.dart';
import '../blocs/cubit/home_cubit.dart';

class BannersSection extends StatefulWidget {
  const BannersSection({super.key});

  @override
  State<BannersSection> createState() => _BannersSectionState();
}

class _BannersSectionState extends State<BannersSection> {
  late CarouselController carouselController;
  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
                            width: Get.width * 0.94,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: AppImage(
                              path: banner.imagePath!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          onPageChanged: (index, reason) =>
                              BlocProvider.of<HomeCubit>(context)
                                  .onBannerChanged(index),
                          viewportFraction: 0.94,
                          autoPlay: true,
                          height: 133.h)),
                ),
                mediumVerticalSpace,
                state.banners!.isNotEmpty
                    ? DotsIndicatorsCards(
                        index: state.currentBannerIndex!,
                        length: state.banners!.length)
                    : const SizedBox()
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

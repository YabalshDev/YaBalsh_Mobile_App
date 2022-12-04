import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                DotsIndicatorsCards(index: 0, length: state.banners!.length)
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

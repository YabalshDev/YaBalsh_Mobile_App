import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/utils/enums/search_navigation_screens.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/yaBalash_toast.dart';
import '../blocs/cubit/home_cubit.dart';

class BannersSection extends StatelessWidget {
  const BannersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.bannersRequestState == RequestState.error) {
          yaBalashCustomToast(message: state.bannersError!, context: context);
        }
      },
      buildWhen: (previous, current) =>
          previous.bannersRequestState != current.bannersRequestState,
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
            return state.banners!.isEmpty
                ? const SizedBox()
                : Column(
                    children: [
                      CarouselImage(state: state),
                      mediumVerticalSpace,
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

class CarouselImage extends StatelessWidget {
  final HomeState state;
  const CarouselImage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider.builder(
          carouselController: CarouselController(),
          itemCount: state.banners!.length,
          itemBuilder: (context, index, realIndex) {
            final banner = state.banners![index];
            return InkWell(
              onTap: () => Get.toNamed(RouteHelper.getSearchRoute(),
                  arguments: [
                    SearchNavigationScreens.sections,
                    banner.section!.name,
                    banner.section!.id
                  ]),
              child: ClipRRect(
                borderRadius: kDefaultBorderRaduis,
                child: Container(
                  width: Get.width * 0.96,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: AppImage(
                    path: banner.imagePath!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
              viewportFraction: 0.86, autoPlay: true, height: 133.h)),
    );
  }
}

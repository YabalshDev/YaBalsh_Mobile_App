import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/on_boarding_list.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/widgets/dots_indicators.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/widgets/page_view_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          if (state is PageIndex) {
            return Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onBoardings.length,
                    onPageChanged: (value) =>
                        Get.find<OnBoardingCubit>().setPageIndex(value),
                    itemBuilder: (context, index) {
                      final onBoarding = onBoardings[index];
                      return PageViewItem(
                          subTitle: onBoarding.subTitile!,
                          imagePath: onBoarding.imagePath!,
                          title: onBoarding.title!);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DotsIndicatorsCards(index: state.index, length: 3),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (state.index > 0) {
                            _pageController.animateToPage(state.index - 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: Text(
                          'تخطي',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (state.index < 2) {
                            _pageController.animateToPage(state.index + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: Text(
                          'التالي',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColorsLight.kAppPrimaryColorLight),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/on_boarding_list.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/widgets/dots_indicators.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/widgets/next_skip_row.dart';
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
                DotsIndicatorsCards(index: state.index, length: 3),
                SizedBox(
                  height: 10.h,
                ),
                state.index < 2
                    ? NextSkipRow(pageController: _pageController)
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: YaBalashCustomButton(
                          title: 'الصفحة الرئيسية',
                          onTap: () {
                            Get.toNamed(RouteHelper.getMainNavigationRoute());
                          },
                        ),
                      ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

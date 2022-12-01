import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class NextSkipRow extends StatelessWidget {
  final PageController pageController;
  const NextSkipRow({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        if (state is PageIndex) {
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (state.index > 0) {
                      pageController.animateToPage(state.index - 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    'تخطي',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (state.index < 2) {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    'التالي',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

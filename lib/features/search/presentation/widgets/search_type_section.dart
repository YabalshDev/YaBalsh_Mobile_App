import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../blocs/cubit/search_cubit.dart';

class SearchTypeSection extends StatelessWidget {
  final PageController pageController;
  const SearchTypeSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return Row(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<SearchCubit>(context).changeSearchType(0);
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Text(
                  'منتجات',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: state.searchTypeIndex == 0
                          ? Colors.black
                          : AppColorsLight.kCancelColor),
                ),
              ),
              smallVerticalSpace,
              state.searchTypeIndex == 0
                  ? Container(
                      color: AppColorsLight.kAppPrimaryColorLight,
                      height: 3.h,
                      width: 19.w,
                    )
                  : const SizedBox()
            ],
          ),
          largeHorizontalSpace,
          Column(
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<SearchCubit>(context).changeSearchType(1);
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Text(
                  'سوبر ماركت',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: state.searchTypeIndex == 1
                          ? Colors.black
                          : AppColorsLight.kCancelColor),
                ),
              ),
              smallVerticalSpace,
              state.searchTypeIndex == 1
                  ? Container(
                      color: AppColorsLight.kAppPrimaryColorLight,
                      height: 3.h,
                      width: 19.w,
                    )
                  : const SizedBox()
            ],
          )
        ],
      );
    });
  }
}

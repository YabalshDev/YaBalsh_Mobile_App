import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../blocs/cubit/search_cubit.dart';

class SearchTypeSection extends StatelessWidget {
  final PageController pageController;
  final GlobalKey<FormBuilderState> searchFormKey;
  const SearchTypeSection(
      {super.key, required this.pageController, required this.searchFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return Padding(
        padding: kDefaultPadding,
        child: Row(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<SearchCubit>(context).changeSearchType(0);
                    BlocProvider.of<SearchCubit>(context)
                        .changeSearchIsEmpty(true);
                    BlocProvider.of<SearchCubit>(context)
                        .changeProductSearchState(RequestState.idle);

                    if (searchFormKey
                        .currentState!.fields['search']!.initialValue
                        .toString()
                        .isNotEmpty) {
                      searchFormKey.currentState!.fields['search']!
                          .setValue('');
                    } else {
                      searchFormKey.currentState!.fields['search']!.reset();
                    }

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
                    BlocProvider.of<SearchCubit>(context)
                        .changeSearchIsEmpty(true);
                    BlocProvider.of<SearchCubit>(context)
                        .changeStoreSearchState(RequestState.idle);
                    if (searchFormKey
                        .currentState!.fields['search']!.initialValue
                        .toString()
                        .isNotEmpty) {
                      searchFormKey.currentState!.fields['search']!
                          .setValue('');
                    } else {
                      searchFormKey.currentState!.fields['search']!.reset();
                    }

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
        ),
      );
    });
  }
}

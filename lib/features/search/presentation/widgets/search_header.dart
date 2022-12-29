import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';

class SearchHeader extends StatelessWidget {
  final String intialValue;
  final GlobalKey<FormBuilderState> searchFormKey;
  const SearchHeader(
      {super.key, required this.intialValue, required this.searchFormKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 8,
            child: FormBuilder(
              key: searchFormKey,
              child: SizedBox(
                height: 32.h,
                child: Container(
                  decoration: kFilledTextFieldDecoration.copyWith(
                      border: Border.all(color: Colors.transparent)),
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          final searchValue = searchFormKey
                              .currentState?.fields['search']!.value as String;
                          if (searchValue.isNotEmpty) {
                            BlocProvider.of<SearchCubit>(context)
                                .saveSearch(searchValue);
                            BlocProvider.of<SearchCubit>(context)
                                .search(searchValue);
                          }
                        },
                        child: const Icon(
                          Icons.search,
                          color: AppColorsLight.kCancelColor,
                        ),
                      ),
                      smallHorizontalSpace,
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'search',
                          initialValue: intialValue,
                          cursorHeight: 25.h,
                          onChanged: (value) {
                            if (value!.isEmpty) {
                              BlocProvider.of<SearchCubit>(context)
                                  .changeSearchIsEmpty(true);
                            } else {
                              BlocProvider.of<SearchCubit>(context)
                                  .changeSearchIsEmpty(false);
                            }
                          },
                          cursorRadius: const Radius.circular(8),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                          cursorColor: AppColorsLight.kAppPrimaryColorLight,
                          decoration: InputDecoration(
                              hintText: 'دور على منتج او سوبر ماركت',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColorsLight.kCancelColor),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 6.h, horizontal: 10.w),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
        mediumHorizontalSpace,
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => Get.back(),
            child: Text(
              'الغاء',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorsLight.kCancelColor),
            ),
          ),
        )
      ],
    );
  }
}

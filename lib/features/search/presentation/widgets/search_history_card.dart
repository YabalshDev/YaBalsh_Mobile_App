import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class SearchHistoryCard extends StatelessWidget {
  final String searchName;
  final GlobalKey<FormBuilderState> searchFormKey;
  const SearchHistoryCard(
      {super.key, required this.searchName, required this.searchFormKey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        searchFormKey.currentState!.fields['search']!.setValue(searchName);
        BlocProvider.of<SearchCubit>(context)
            .changeSearchIsEmpty(false); // change to searching state
        BlocProvider.of<SearchCubit>(context).search(searchName);
      },
      child: Container(
          decoration: kDefaultBoxDecoration.copyWith(
              border: Border.all(
                color: Colors.transparent,
              ),
              color: AppColorsLight.kDisabledButtonColor),
          padding: kSmallPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSvgIcon(
                iconPath: AppAssets.historyIcon,
                height: 12.h,
                width: 12.w,
                color: AppColorsLight.kDisabledButtonTextColor,
              ),
              smallHorizontalSpace,
              Text(
                searchName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColorsLight.kDisabledButtonTextColor),
              )
            ],
          )),
    );
  }
}

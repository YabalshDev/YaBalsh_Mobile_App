import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/near_stores_list.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/home_cubit.dart';
import 'Title_row.dart';

class NearStoresSection extends StatelessWidget {
  const NearStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      switch (state.lastOfferrequestState) {
        case RequestState.loading:
          return SizedBox(
            height: 100.h,
            child: ListView.builder(
              padding: kScaffoldPadding,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[850]!,
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                        color: AppColorsLight.kMainCategoryCardColor,
                        borderRadius: kDefaultBorderRaduis),
                  ),
                );
              },
            ),
          );
        case RequestState.loaded:
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleRow(title: 'السوبر ماركتس القريبة منك  🏠'),
              mediumVerticalSpace,
              NearStoresList(stores: state.nearStores!, isWithPadding: true),
            ],
          );

        case RequestState.error:
          return const SizedBox();

        default:
          return const SizedBox();
      }
    });
  }
}

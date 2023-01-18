import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/main_navigation_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import 'Title_row.dart';

class LastOfferSection extends StatelessWidget {
  const LastOfferSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
                      width: 60.w,
                      height: 60.h,
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
            return state.lastOffers!.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleRow(
                          title: 'اكتشف ارخص العروض',
                          onSelectAll: () =>
                              BlocProvider.of<MainNavigationCubit>(context)
                                  .changePage(1)),
                      mediumVerticalSpace,
                      SizedBox(
                        height: 110.h,
                        child: ListView.builder(
                          padding: kScaffoldPadding,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: state.lastOffers!.length,
                          itemBuilder: (context, index) {
                            final mainCategory = state.lastOffers![index];
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomCard(
                                      width: 65.w,
                                      height: 65.h,
                                      isAssetImage: false,
                                      imagePath: mainCategory.imagePath,
                                      backgroundColor:
                                          AppColorsLight.kSubCategoryCardColor,
                                      withBorder: false,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: 90.w,
                                      ),
                                      child: Text(
                                        mainCategory.name!,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                                mediumHorizontalSpace
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );

          case RequestState.error:
            return SizedBox(
              height: 100.h,
              child: Center(
                child: Text(state.lastOffersError!),
              ),
            );

          default:
            return SizedBox(
              height: 100.h,
            );
        }
      },
    );
  }
}

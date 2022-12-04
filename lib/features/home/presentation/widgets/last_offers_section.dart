import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';

class LastOfferSection extends StatelessWidget {
  const LastOfferSection({super.key});

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
            return SizedBox(
              height: 100.h,
              child: ListView.builder(
                padding: kScaffoldPadding,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.lastOffers!.length,
                itemBuilder: (context, index) {
                  final mainCategory = state.lastOffers![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        margin: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                            color: AppColorsLight.kMainCategoryCardColor,
                            borderRadius: kDefaultBorderRaduis),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    mainCategory.imagePath!,
                                    fit: BoxFit.cover,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'حتى 20% خصم',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w900),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        mainCategory.name!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      )
                    ],
                  );
                },
              ),
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

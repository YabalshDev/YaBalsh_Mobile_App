import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_product_card.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import 'Title_row.dart';

class KewordSection extends StatelessWidget {
  // final Section section;
  final int order;
  const KewordSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (order) {
          case 1:
            switch (state.firstSectionRequestState) {
              case RequestState.loading:
                return Column(
                  children: [
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        padding: kScaffoldPadding,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[800]!,
                            highlightColor: Colors.grey[850]!,
                            child: Container(
                              width: 133.w,
                              height: 140.h,
                              margin: EdgeInsets.only(left: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColorsLight.kMainCategoryCardColor,
                                  borderRadius: kDefaultBorderRaduis),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );

              case RequestState.loaded:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleRow(title: state.firstSection!.keyWord!),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 280.h,
                      child: ListView.builder(
                        padding: kScaffoldPadding,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.firstSection!.products!.length,
                        itemBuilder: (context, index) {
                          final product = state.firstSection!.products![index];
                          return HomeProductCard(product: product);
                        },
                      ),
                    )
                  ],
                );

              case RequestState.error:
                return const SizedBox();

              default:
                return const SizedBox.shrink();
            }

          default:
            return const SizedBox();
        }
      },
    );
  }
}

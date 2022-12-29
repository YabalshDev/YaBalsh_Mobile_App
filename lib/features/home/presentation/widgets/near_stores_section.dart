import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/near_stores_list.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/home_cubit.dart';

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
          return NearStoresList(stores: state.nearStores!, isWithPadding: true);

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

        // return SizedBox(
        //   height: 100.h,
        //   child: ListView.builder(
        //     padding: kScaffoldPadding,
        //     scrollDirection: Axis.horizontal,
        //     shrinkWrap: true,
        //     itemCount: storesMock.length,
        //     itemBuilder: (context, index) {
        //       final store = storesMock[index];
        //       return Container(
        //         margin: EdgeInsets.only(left: 10.w),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             CustomCard(
        //               imagePath: store.imagePath,
        //             ),
        //             SizedBox(
        //               height: 5.h,
        //             ),
        //             Text(
        //               store.name!,
        //               style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //                   fontWeight: FontWeight.w700, color: Colors.black),
        //             )
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // );
      }
    });
  }
}

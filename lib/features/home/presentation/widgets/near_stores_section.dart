import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/near_stores_list.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/utils/enums/search_navigation_screens.dart';
import '../blocs/cubit/home_cubit.dart';
import 'Title_row.dart';

class NearStoresSection extends StatelessWidget {
  const NearStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            previous.nearStoreRequestState != current.nearStoreRequestState,
        builder: (context, state) {
          switch (state.nearStoreRequestState) {
            case RequestState.loading:
              return const NearStoresLoading();
            case RequestState.loaded:
              return state.nearStores!.isEmpty
                  ? const SizedBox()
                  : const NearStoresLoaded();

            case RequestState.error:
              return const SizedBox();

            default:
              return const SizedBox();
          }
        });
  }
}

class NearStoresLoaded extends StatelessWidget {
  const NearStoresLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRow(
          title: 'السوبر ماركتس القريبة منك  🏠',
          onSelectAll: () {
            final zoneName = getIt<ZoneService>().currentSubZone!.name;
            Get.toNamed(RouteHelper.getSearchRoute(), arguments: [
              SearchNavigationScreens.nearStoresScreen,
              zoneName,
              0
            ]);
          },
        ),
        mediumVerticalSpace,
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return NearStoresList(
                isWithPadding: true, stores: state.nearStores!);
          },
        ),
      ],
    );
  }
}

class NearStoresLoading extends StatelessWidget {
  const NearStoresLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: kScaffoldPadding,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return CustomShimmer(
            height: 50.h,
            width: 50.w,
          );
        },
      ),
    );
  }
}

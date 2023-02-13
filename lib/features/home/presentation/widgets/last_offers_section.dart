import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/main_navigation_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import 'Title_row.dart';
import 'last_offers_card.dart';

class LastOfferSection extends StatelessWidget {
  const LastOfferSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.lastOfferrequestState == RequestState.error) {
          yaBalashCustomToast(
              message: state.lastOffersError!, context: context);
        }
      },
      buildWhen: (previous, current) =>
          previous.lastOfferrequestState != current.lastOfferrequestState,
      builder: (context, state) {
        switch (state.lastOfferrequestState) {
          case RequestState.loading:
            return const LastOffersLoading();
          case RequestState.loaded:
            return state.lastOffers!.isEmpty
                ? const SizedBox()
                : const LastOffersLoaded();

          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class LastOffersLoaded extends StatelessWidget {
  const LastOffersLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleRow(
                title: 'اكتشف ارخص العروض',
                onSelectAll: () => BlocProvider.of<MainNavigationCubit>(context)
                    .changePage(1)),
            mediumVerticalSpace,
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                padding: kScaffoldPadding,
                scrollDirection: Axis.horizontal,
                itemCount: state.lastOffers!.length,
                itemBuilder: (context, index) {
                  final mainCategory = state.lastOffers![index];
                  return LastOfferCard(mainCategory: mainCategory);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class LastOffersLoading extends StatelessWidget {
  const LastOffersLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: kScaffoldPadding,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade400,
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
  }
}

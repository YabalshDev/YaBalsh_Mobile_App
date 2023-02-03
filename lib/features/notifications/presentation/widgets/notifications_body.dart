import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_header.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';

import 'package:yabalash_mobile_app/features/notifications/presentation/blocs/cubit/notifications_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';
import 'notifications_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              const CustomHeader(
                iconPath: AppAssets.backIcon,
                title: 'الاشعارات',
              ),
              mediumVerticalSpace,
              largeVerticalSpace,
              const NotificationsListSection()
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsListSection extends StatelessWidget {
  const NotificationsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        switch (state.notificationsRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const NotificationsLoading();
          case RequestState.loaded:
            return const NotificationsLoaded();
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(
                child: EmptyIndicator(title: state.errorMessage!),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class NotificationsLoading extends StatelessWidget {
  const NotificationsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomShimmer(
          height: 80.h,
          width: Get.width,
        );
      },
    );
  }
}

class NotificationsLoaded extends StatelessWidget {
  const NotificationsLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.notifications!.isEmpty
            ? SizedBox(
                height: Get.height * 0.6,
                child: const Center(
                  child: EmptyIndicator(title: 'لا يوجد اشعارات'),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: state.notifications!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final notification = state.notifications![index];
                  return NotificationCard(notification: notification);
                },
              );
      },
    );
  }
}

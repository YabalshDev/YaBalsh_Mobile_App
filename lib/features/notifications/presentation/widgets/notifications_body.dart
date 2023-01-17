import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_header.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/features/notifications/presentation/blocs/cubit/notifications_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';

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
                isWithNotification: false,
                title: 'الاشعارات',
              ),
              mediumVerticalSpace,
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
          case RequestState.loaded:
            return state.notifications!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                      child: EmptyIndicator(title: 'لا يوجد اشعارات'),
                    ),
                  )
                : ListView.builder(
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

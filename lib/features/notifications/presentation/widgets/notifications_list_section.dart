import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/notifications_cubit.dart';
import 'notifications_loaded.dart';
import 'notifications_loading.dart';

class NotificationsListSection extends StatelessWidget {
  const NotificationsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        switch (state.notificationsRequestState) {
          case RequestState.loading:
            return const NotificationsLoading();
          case RequestState.idle:
          case RequestState.loaded:
            return const NotificationsLoaded();
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(
                child: ErrorIndicator(errorMessage: state.errorMessage!),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

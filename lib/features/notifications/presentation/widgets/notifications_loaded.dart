import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/utils/pagination_loader.dart';

import '../../../../core/utils/enums/empty_states.dart';
import '../../../../core/widgets/custom_animated_widget.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/notifications_cubit.dart';
import 'notifications_card.dart';

class NotificationsLoaded extends StatefulWidget {
  const NotificationsLoaded({super.key});

  @override
  State<NotificationsLoaded> createState() => _NotificationsLoadedState();
}

class _NotificationsLoadedState extends State<NotificationsLoaded> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        BlocProvider.of<NotificationsCubit>(context)
            .handleNotificationsPagination();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.notifications!.isEmpty
            ? const Center(
                child: EmptyIndicator(
                    emptyStateType: EmptyStates.other,
                    title: 'لا يوجد اشعارات'),
              )
            : Column(
                children: [
                  Expanded(
                    child: CustomAnimatedWidget(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: state.notifications!.length,
                        itemBuilder: (context, index) {
                          final notification = state.notifications![index];
                          return NotificationCard(notification: notification);
                        },
                      ),
                    ),
                  ),
                  smallVerticalSpace,
                  PaginationLoaderIndicator(active: state.paginationLoading!)
                ],
              );
      },
    );
  }
}

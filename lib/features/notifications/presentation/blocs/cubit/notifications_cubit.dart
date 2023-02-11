// ignore_for_file: prefer_final_fields

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/usecases/get_all_notifications_usecase.dart';

import '../../../../../core/widgets/custom_dialog.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetAllNotificationsUseCase getAllNotificationsUseCase;
  NotificationsCubit({required this.getAllNotificationsUseCase})
      : super(const NotificationsState());

  List<Notification> _notifications = [];
  int _currentPage = 1;

  void getAllNotifications() async {
    final response = await getAllNotificationsUseCase(
        GetAllNotificationsParams(page: _currentPage));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          notificationsRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    }, (result) {
      if (result.isNotEmpty) {
        _currentPage++;
      }
      _notifications.addAll(result);
      emit(state.copyWith(
          paginationLoading: false,
          notificationsRequestState: RequestState.loaded,
          notifications: _notifications));
    });
  }

  void handleNotificationsPagination() {
    emit(state.copyWith(
        paginationLoading: true, notificationsRequestState: RequestState.idle));

    getAllNotifications();
  }
}

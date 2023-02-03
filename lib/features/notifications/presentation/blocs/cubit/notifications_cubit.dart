import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/usecases/get_all_notifications_usecase.dart';

import '../../../../../core/usecases/use_cases.dart';
import '../../../../../core/widgets/custom_dialog.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetAllNotificationsUseCase getAllNotificationsUseCase;
  NotificationsCubit({required this.getAllNotificationsUseCase})
      : super(const NotificationsState());

  void getAllNotifications() async {
    final response = await getAllNotificationsUseCase(NoParams());

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
    },
        (result) => emit(state.copyWith(
            notificationsRequestState: RequestState.loaded,
            notifications: result)));
  }
}

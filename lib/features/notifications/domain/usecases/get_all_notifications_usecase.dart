import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/repositories/notification_repository.dart';

class GetAllNotificationsUseCase
    implements UseCase<List<Notification>, GetAllNotificationsParams> {
  final NotificationRepository notificationRepository;

  GetAllNotificationsUseCase({required this.notificationRepository});
  @override
  Future<Either<Failure, List<Notification>>> call(
          GetAllNotificationsParams params) =>
      notificationRepository.getAllNotification(page: params.page);
}

class GetAllNotificationsParams extends Equatable {
  final int? page;

  const GetAllNotificationsParams({this.page});

  @override
  List<Object?> get props => [page];
}

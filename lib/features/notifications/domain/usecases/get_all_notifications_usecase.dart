import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/repositories/notification_repository.dart';

class GetAllNotificationsUseCase
    implements UseCase<List<Notification>, NoParams> {
  final NotificationRepository notificationRepository;

  GetAllNotificationsUseCase({required this.notificationRepository});
  @override
  Future<Either<Failure, List<Notification>>> call(NoParams params) =>
      notificationRepository.getAllNotification();
}

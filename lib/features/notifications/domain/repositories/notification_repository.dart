import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getAllNotification({int? page});
}

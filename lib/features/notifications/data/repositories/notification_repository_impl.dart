import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotificationRepositoryImpl({required this.notificationRemoteDataSource});
  @override
  Future<Either<Failure, List<Notification>>> getAllNotification() async {
    try {
      final result = await notificationRemoteDataSource.getAllNotifications();
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }
}

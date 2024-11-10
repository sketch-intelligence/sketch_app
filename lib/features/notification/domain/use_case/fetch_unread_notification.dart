import 'package:dartz/dartz.dart';
import 'package:sketch/core/errors/failure.dart';
import 'package:sketch/features/notification/data/model/notificatioin_model.dart';
import 'package:sketch/features/notification/domain/repositories/notification_repository.dart';

class FetchUnreadNotification {
  final NotificationRepository notificationRepository;

  FetchUnreadNotification({required this.notificationRepository});
  Future<Either<Failure, List<NotificationModel>>> call() async {
    return await notificationRepository.fetchUnreadNotifications();
  }
}

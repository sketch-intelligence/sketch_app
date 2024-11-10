part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoadingState extends NotificationState {}

final class NotificationSuccessState extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationSuccessState({required this.notifications});
}

final class NotificationFailureState extends NotificationState {}

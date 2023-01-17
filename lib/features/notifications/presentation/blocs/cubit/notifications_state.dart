part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<Notification>? notifications;
  final RequestState? notificationsRequestState;
  final String? errorMessage;
  const NotificationsState(
      {this.notifications = const [],
      this.notificationsRequestState = RequestState.loading,
      this.errorMessage = ''});

  NotificationsState copyWith(
          {List<Notification>? notifications,
          RequestState? notificationsRequestState,
          String? errorMessage}) =>
      NotificationsState(
          errorMessage: errorMessage ?? this.errorMessage,
          notifications: notifications ?? this.notifications,
          notificationsRequestState:
              notificationsRequestState ?? this.notificationsRequestState);

  @override
  List<Object> get props => [];
}

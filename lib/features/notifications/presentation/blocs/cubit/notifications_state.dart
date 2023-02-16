part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<Notification>? notifications;
  final RequestState? notificationsRequestState;
  final String? errorMessage;
  final bool? paginationLoading;
  const NotificationsState(
      {this.notifications = const [],
      this.paginationLoading = false,
      this.notificationsRequestState = RequestState.loading,
      this.errorMessage = ''});

  NotificationsState copyWith(
          {List<Notification>? notifications,
          RequestState? notificationsRequestState,
          bool? paginationLoading,
          String? errorMessage}) =>
      NotificationsState(
          errorMessage: errorMessage ?? this.errorMessage,
          notifications: notifications ?? this.notifications,
          paginationLoading: paginationLoading ?? this.paginationLoading,
          notificationsRequestState:
              notificationsRequestState ?? this.notificationsRequestState);

  @override
  List<Object> get props => [
        errorMessage!,
        notifications!,
        notificationsRequestState!,
        paginationLoading!
      ];
}

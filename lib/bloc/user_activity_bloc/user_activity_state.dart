part of 'user_activity_bloc.dart';

abstract class UserActivityState {
  const UserActivityState();
}

class UserActivityLoading extends UserActivityState {}

class UserActivityLoaded extends UserActivityState {
  final List<UserActivity> userActivityList;
  final int newNotificationsCount;

  UserActivityLoaded(this.userActivityList, this.newNotificationsCount);
}

class UserActivityError extends UserActivityState {
  final String error;

  UserActivityError(this.error);
}

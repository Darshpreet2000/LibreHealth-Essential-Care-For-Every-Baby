part of 'user_activity_bloc.dart';

abstract class UserActivityState {
  const UserActivityState();

  get userActivityList => null;
}

class UserActivityLoading extends UserActivityState {}

class UserActivityLoaded extends UserActivityState {
  final List<UserActivity> userActivityList;
  final int newNotificationsCount;

  UserActivityLoaded(this.userActivityList, this.newNotificationsCount);
}

class UserActivityLoadedWithProgress extends UserActivityState {
  final List<UserActivity> userActivityList;
  final int newNotificationsCount;

  UserActivityLoadedWithProgress(
      this.userActivityList, this.newNotificationsCount);
}

class UserActivityError extends UserActivityState {
  final String error;

  UserActivityError(this.error);
}

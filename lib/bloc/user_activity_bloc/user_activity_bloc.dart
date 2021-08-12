import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/user_activity.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/user_activity_repository.dart';

part 'user_activity_event.dart';
part 'user_activity_state.dart';

class UserActivityBloc extends Bloc<UserActivityEvent, UserActivityState> {
  UserActivityRepository _userActivityRepository;
  HiveStorageRepository hiveStorageRepository;
  UserActivityBloc(this._userActivityRepository, this.hiveStorageRepository)
      : super(UserActivityLoading());
  int currentPage = 1;

  @override
  Stream<UserActivityState> mapEventToState(
    UserActivityEvent event,
  ) async* {
    yield UserActivityLoading();
    if (event is UserActivityFetch) {
      try {
        yield UserActivityLoaded(
            hiveStorageRepository.getNotificationsList(), 0);
        List<UserActivity> response =
            await _userActivityRepository.fetchUsersMessages(currentPage);
        int countNewNotifications =
            _userActivityRepository.countNewNotifications(response);
        hiveStorageRepository.storeNotifications(response);
        yield UserActivityLoaded(response, countNewNotifications);
      } catch (e) {
        yield UserActivityError(e.toString());
        yield UserActivityLoaded(
            hiveStorageRepository.getNotificationsList(), 0);
      }
    } else if (event is UserActivityLoadMore) {
      currentPage++;
      try {
        yield UserActivityLoadedWithProgress(
            hiveStorageRepository.getNotificationsList(), 0);
        List<UserActivity> response =
            await _userActivityRepository.fetchUsersMessages(currentPage);
        List<UserActivity> previousList =
            hiveStorageRepository.getNotificationsList();
        // add new content to previous list
        previousList += response;
        hiveStorageRepository.storeNotifications(previousList);
        yield UserActivityLoaded(previousList, 0);
      } catch (e) {
        yield UserActivityError(e.toString());
        yield UserActivityLoaded(
            hiveStorageRepository.getNotificationsList(), 0);
      }
    }
  }
}

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

  @override
  Stream<UserActivityState> mapEventToState(
    UserActivityEvent event,
  ) async* {
    yield UserActivityLoading();
    if (event is UserActivityFetch) {
      try {
        List<UserActivity> response =
            await _userActivityRepository.fetchUsersMessages();
        hiveStorageRepository.storeNotifications(response);
        yield UserActivityLoaded(response);
      } catch (e) {
        yield UserActivityError(e.toString());
        yield UserActivityLoaded(hiveStorageRepository.getNotificationsList());
      }
    }
    if (event is UserActivityAddNotification) {
      List<UserActivity> response =
          hiveStorageRepository.getNotificationsList();
      response.add(event.notifications);
      hiveStorageRepository.storeNotifications(response);
      yield UserActivityLoaded(response);
    }
  }
}

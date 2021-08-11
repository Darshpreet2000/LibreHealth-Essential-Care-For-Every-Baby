import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  HiveStorageRepository hiveStorageRepository;
  SettingsBloc(this.hiveStorageRepository)
      : super(SettingsState(
            hiveStorageRepository.getThemeData(),
            hiveStorageRepository.getNotificationSoundEnabled(),
            hiveStorageRepository.getNotificationEnabled()));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsChanged) {
      hiveStorageRepository.storeThemeData(event.isDarkModeEnabled);
      hiveStorageRepository
          .storeNotificationSoundEnabled(event.isNotificationSoundEnabled);
      hiveStorageRepository
          .storeNotificationEnabled(event.isNotificationEnabled);
      yield SettingsState(event.isDarkModeEnabled,
          event.isNotificationSoundEnabled, event.isNotificationEnabled);
    }
  }
}

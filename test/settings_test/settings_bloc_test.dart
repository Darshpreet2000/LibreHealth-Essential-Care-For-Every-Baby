import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/settings_bloc/settings_bloc.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:test/test.dart';

import 'settings_bloc_test.mocks.dart';

@GenerateMocks([HiveStorageRepository])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockHiveRepo = MockHiveStorageRepository();
  //Flutter Settings BloC test
  //Test Cases
  //yields SettingsState on toggle of dark mode
  //yields SettingsState on change of notifications sound
  //yields SettingsState on toggle of notifications
  group('SettingsBloc testing', () {
    bool isDarkModeEnabled = false;
    bool isNotificationSoundEnabled = false;
    bool isNotificationEnabled = false;
    blocTest<SettingsBloc, SettingsState>(
      ' yields SettingsState on change of dark mode',
      build: () {
        isDarkModeEnabled = true;
        isNotificationSoundEnabled = false;
        isNotificationEnabled = false;

        when(_mockHiveRepo.getThemeData()).thenReturn(isDarkModeEnabled);
        when(_mockHiveRepo.getNotificationSoundEnabled())
            .thenReturn(isNotificationSoundEnabled);
        when(_mockHiveRepo.getNotificationEnabled())
            .thenReturn(isNotificationEnabled);
        SettingsBloc settingsBloc = new SettingsBloc(_mockHiveRepo);
        when(_mockHiveRepo.storeThemeData(isDarkModeEnabled)).thenReturn(null);

        when(_mockHiveRepo
                .storeNotificationSoundEnabled(isNotificationSoundEnabled))
            .thenReturn(null);

        when(_mockHiveRepo.storeNotificationEnabled(isNotificationEnabled))
            .thenReturn(null);
        return settingsBloc;
      },
      act: (bloc) => bloc.add(SettingsChanged(isDarkModeEnabled,
          isNotificationSoundEnabled, isNotificationEnabled)),
      expect: () => [
        SettingsState(isDarkModeEnabled, isNotificationSoundEnabled,
            isNotificationEnabled)
      ],
    );
    blocTest<SettingsBloc, SettingsState>(
      'yields SettingsState on change of notifications sound',
      build: () {
        isDarkModeEnabled = false;
        isNotificationSoundEnabled = true;
        isNotificationEnabled = false;
        when(_mockHiveRepo.getThemeData()).thenReturn(isDarkModeEnabled);
        when(_mockHiveRepo.getNotificationSoundEnabled())
            .thenReturn(isNotificationSoundEnabled);
        when(_mockHiveRepo.getNotificationEnabled())
            .thenReturn(isNotificationEnabled);
        SettingsBloc settingsBloc = new SettingsBloc(_mockHiveRepo);
        when(_mockHiveRepo.storeThemeData(isDarkModeEnabled)).thenReturn(null);

        when(_mockHiveRepo
                .storeNotificationSoundEnabled(isNotificationSoundEnabled))
            .thenReturn(null);

        when(_mockHiveRepo.storeNotificationEnabled(isNotificationEnabled))
            .thenReturn(null);
        return settingsBloc;
      },
      act: (bloc) => bloc.add(SettingsChanged(isDarkModeEnabled,
          isNotificationSoundEnabled, isNotificationEnabled)),
      expect: () => [
        SettingsState(isDarkModeEnabled, isNotificationSoundEnabled,
            isNotificationEnabled)
      ],
    );
    blocTest<SettingsBloc, SettingsState>(
      'yields SettingsState on toggle of notifications',
      build: () {
        isDarkModeEnabled = false;
        isNotificationSoundEnabled = false;
        isNotificationEnabled = true;
        when(_mockHiveRepo.getThemeData()).thenReturn(isDarkModeEnabled);
        when(_mockHiveRepo.getNotificationSoundEnabled())
            .thenReturn(isNotificationSoundEnabled);
        when(_mockHiveRepo.getNotificationEnabled())
            .thenReturn(isNotificationEnabled);

        SettingsBloc settingsBloc = new SettingsBloc(_mockHiveRepo);
        when(_mockHiveRepo.storeThemeData(isDarkModeEnabled)).thenReturn(null);

        when(_mockHiveRepo
                .storeNotificationSoundEnabled(isNotificationSoundEnabled))
            .thenReturn(null);

        when(_mockHiveRepo.storeNotificationEnabled(isNotificationEnabled))
            .thenReturn(null);
        return settingsBloc;
      },
      act: (bloc) => bloc.add(SettingsChanged(isDarkModeEnabled,
          isNotificationSoundEnabled, isNotificationEnabled)),
      expect: () => [
        SettingsState(isDarkModeEnabled, isNotificationSoundEnabled,
            isNotificationEnabled)
      ],
    );
  });
}

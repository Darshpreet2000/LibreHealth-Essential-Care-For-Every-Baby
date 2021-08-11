part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool isDarkModeEnabled;
  final bool isNotificationSoundEnabled;
  final bool isNotificationEnabled;
  SettingsState(this.isDarkModeEnabled, this.isNotificationSoundEnabled,
      this.isNotificationEnabled);
  @override
  List<Object> get props =>
      [isDarkModeEnabled, isNotificationSoundEnabled, isNotificationEnabled];
}

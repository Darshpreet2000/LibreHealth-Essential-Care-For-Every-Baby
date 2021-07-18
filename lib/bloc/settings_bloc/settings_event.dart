part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsChanged extends SettingsEvent {
  final bool isDarkModeEnabled;
  final bool isNotificationSoundEnabled;
  final bool isNotificationEnabled;
  SettingsChanged(this.isDarkModeEnabled, this.isNotificationSoundEnabled,
      this.isNotificationEnabled);
  @override
  List<Object> get props =>
      [isDarkModeEnabled, isNotificationSoundEnabled, isNotificationEnabled];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/settings_bloc/settings_bloc.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: AppBar().preferredSize.height + 26),
          width: MediaQuery.of(context).size.width / 1.6,
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  trailing: Icon(Icons.close,
                      color: Theme.of(context).iconTheme.color),
                  title: Text(AppLocalizations.of(context)!.settings),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.notifications),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                  trailing: Switch(
                      value: state.isNotificationEnabled,
                      onChanged: (value) {
                        BlocProvider.of<SettingsBloc>(context).add(
                            SettingsChanged(state.isDarkModeEnabled,
                                state.isNotificationSoundEnabled, value));
                      }),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.notificationsSound),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                  trailing: Switch(
                      value: state.isNotificationSoundEnabled,
                      onChanged: (value) {
                        BlocProvider.of<SettingsBloc>(context).add(
                            SettingsChanged(state.isDarkModeEnabled, value,
                                state.isNotificationEnabled));
                      }),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nightMode),
                  trailing: Switch(
                      value: state.isDarkModeEnabled,
                      onChanged: (value) {
                        BlocProvider.of<SettingsBloc>(context).add(
                            SettingsChanged(
                                value,
                                state.isNotificationSoundEnabled,
                                state.isNotificationEnabled));
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newborn_care/screens/profile/components/settings_drawer.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/body.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool scrollEnabled = true;
  void enableDisableScroll() {
    setState(() {
      scrollEnabled = !scrollEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SafeArea(child: SettingsDrawer()),
      body: CustomScrollView(
        physics: scrollEnabled
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            actions: <Widget>[Container()],
            floating: true,
            automaticallyImplyLeading: false,
            elevation: 20,
            forceElevated: true,
            pinned: true,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            flexibleSpace: MediaQuery.of(context).orientation ==
                    Orientation.portrait
                ? ShortAppBar(
                    title: AppLocalizations.of(context)!.eceb,
                    showDrawer: true,
                  )
                : ShortAppBar(
                    title:
                        AppLocalizations.of(context)!.essentialCareForEveryBaby,
                    showDrawer: true,
                  ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Body(enableDisableScroll),
          ]))
        ],
      ),
    );
  }
}

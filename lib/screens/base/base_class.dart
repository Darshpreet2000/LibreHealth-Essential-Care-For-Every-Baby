import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:newborn_care/screens/home/home_screen.dart';
import 'package:newborn_care/screens/list_of_babies/list_of_babies_screen.dart';
import 'package:newborn_care/screens/notifications/notification_screen.dart';
import 'package:newborn_care/screens/profile/profile_screen.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BaseClass extends StatefulWidget {
  final GlobalKey? globalKey;
  final GlobalKey? drawerKey;
  const BaseClass({Key? key, this.globalKey, this.drawerKey}) : super(key: key);

  @override
  _BaseClassState createState() => _BaseClassState();
}

class _BaseClassState extends State<BaseClass> {
  int selectedIndex = 0;
  @override
  void initState() {
    BlocProvider.of<RefreshBloc>(context).add(RefreshEventStart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.drawerKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            ListTile(
              leading: Icon(Icons.schedule,
                  color: Theme.of(context).iconTheme.color),
              title: Text(
                AppLocalizations.of(context)!.doctorsSchedule,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.message, color: Theme.of(context).iconTheme.color),
              title: Text(AppLocalizations.of(context)!.messages),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.info_rounded,
                  color: Theme.of(context).iconTheme.color),
              title: Text(AppLocalizations.of(context)!.about),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.share, color: Theme.of(context).iconTheme.color),
              title: Text(AppLocalizations.of(context)!.shareApp),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.bug_report,
                  color: Theme.of(context).iconTheme.color),
              title: Text(AppLocalizations.of(context)!.reportABug),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: FutureBuilder(
                future: getAppInfo(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "v " + snapshot.data,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return Text(
                    "v 1.0.0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: BlocListener<RefreshBloc, RefreshState>(
        listener: (context, state) {
          if (state is RefreshLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Syncing data with DHIS2")));
          }
          if (state is RefreshLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Data synced")));
          }
          if (state is RefreshError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<RefreshBloc>(context).add(RefreshEventStart());
          },
          child: IndexedStack(
            index: selectedIndex,
            children: <Widget>[
              Home(
                globalKey: widget.globalKey,
              ),
              ListOfBabies(),
              Notifications(),
              Profile()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: widget.globalKey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 25,
            ),
            label: AppLocalizations.of(context)!.listOfBabies,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: AppLocalizations.of(context)!.notifications,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue[800],
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;
    return version;
  }

  Widget _createHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Color(0xff82A0C8)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/libre_white.png',
                    height: 220,
                    width: 220,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                AppLocalizations.of(context)!.helpingBabiesSurvive,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

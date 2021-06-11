import 'package:flutter/material.dart';
import 'package:newborn_care/screens/base/base_class.dart';
import 'package:newborn_care/screens/facility_login/facility_login.dart';
import 'package:newborn_care/screens/individual_login/individual_login.dart';
import 'package:newborn_care/screens/initial_screen/initial_screen.dart';
import 'package:newborn_care/screens/register_a_baby/register_a_baby.dart';
import 'package:newborn_care/theme/theme_provider.dart';

void main() {
  runApp(MyApp());
}

GlobalKey<ScaffoldState>? drawerKey;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialAppRoute = '/';
    GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
    drawerKey = new GlobalKey<ScaffoldState>();

    return Center(
      child: MaterialApp(
        theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
        title: 'Newborn Care',
        routes: {
          '/': (context) => InitialScreen(),
          '/FacilityLoginScreen': (context) => FacilityLogin(),
          '/IndividualLoginScreen': (context) => IndividualLogin(),
          '/RegisterABaby': (context) => RegisterABaby(),
          '/Base': (context) => BaseClass(
                globalKey: globalKey,
                drawerKey: drawerKey,
              ),
        },
        initialRoute: initialAppRoute,
      ),
    );
  }
}

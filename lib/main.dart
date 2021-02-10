import 'package:flutter/material.dart';
import 'package:newborn_care/screens/baby_detail/baby_details.dart';
import 'package:newborn_care/screens/base/base_class.dart';
import 'package:newborn_care/screens/facility_login/facility_login.dart';
import 'package:newborn_care/screens/individual_login/individual_login.dart';
import 'package:newborn_care/screens/initial_screen/initial_screen.dart';
import 'package:newborn_care/screens/register_a_baby/register_a_baby.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialAppRoute = '/';
    GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => InitialScreen(),
        '/FacilityLoginScreen': (context) => FacilityLogin(),
        '/IndividualLoginScreen': (context) => IndividualLogin(),

        '/RegisterABaby': (context) => RegisterABaby(),

        '/BabyDetails': (context) => BabyDetails(),
        '/Base': (context) => BaseClass(
              globalKey: globalKey,
            ),
      },
      initialRoute: initialAppRoute,
    );
  }
}

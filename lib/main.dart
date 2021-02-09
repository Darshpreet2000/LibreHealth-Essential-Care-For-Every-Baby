import 'package:flutter/material.dart';
import 'package:newborn_care/screens/base/base_class.dart';
import 'package:newborn_care/screens/facility_login/facility_login.dart';
import 'package:newborn_care/screens/individual_login/individual_login.dart';
import 'package:newborn_care/screens/initial_screen/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialAppRoute = '/InitialScreen';

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/InitialScreen': (context) => InitialScreen(),
        '/FacilityLoginScreen': (context) => FacilityLogin(),
        '/IndividualLoginScreen': (context) => IndividualLogin(),
        '/Base': (context) => BaseClass(),
      },
      initialRoute: initialAppRoute,
    );
  }
}

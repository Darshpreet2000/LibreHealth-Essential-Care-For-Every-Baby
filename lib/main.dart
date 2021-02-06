import 'package:flutter/material.dart';
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

      },
      initialRoute: initialAppRoute,
    );
  }
}


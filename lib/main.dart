import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/repository/register_baby_repository.dart'; 
import 'package:newborn_care/screens/base/base_class.dart';
import 'package:newborn_care/screens/facility_login/facility_login.dart';
import 'package:newborn_care/screens/individual_login/individual_login.dart';
import 'package:newborn_care/screens/initial_screen/initial_screen.dart';
import 'package:newborn_care/screens/register_a_baby/register_a_baby.dart';
import 'package:newborn_care/theme/theme_provider.dart';
import 'bloc/register_baby_bloc/register_baby_bloc.dart';

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

    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBabyBloc>(
          create: (BuildContext context) => RegisterBabyBloc(
              RegisterBabyModel(), RegisterBabyRepositoryImpl()),
        ),
      ],
      child: Center(
        child: MaterialApp(
          title: 'Newborn Care',
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
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
      ),
    );
  }
}

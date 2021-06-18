import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:newborn_care/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/repository/HiveStorageRepository.dart';
import 'package:newborn_care/repository/authentication_repository.dart';
import 'package:newborn_care/repository/register_baby_repository.dart';
import 'package:newborn_care/screens/baby_assessments/baby_assessments.dart';
import 'package:newborn_care/screens/base/base_class.dart';
import 'package:newborn_care/screens/facility_login/facility_login.dart';
import 'package:newborn_care/screens/individual_login/individual_login.dart';
import 'package:newborn_care/screens/initial_screen/initial_screen.dart';
import 'package:newborn_care/screens/register_a_baby/register_a_baby.dart';
import 'package:newborn_care/theme/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/register_baby_bloc/register_baby_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHive();
  runApp(MyApp());
}

GlobalKey<ScaffoldState>? drawerKey;
Future registerHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox('eceb');
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialAppRoute = '/';
  @override
  void initState() {
    if (HiveStorageRepository().checkUserLoggedIn()) {
      initialAppRoute = '/Base';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
    drawerKey = new GlobalKey<ScaffoldState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBabyBloc>(
          create: (BuildContext context) => RegisterBabyBloc(
              RegisterBabyModel(), RegisterBabyRepositoryImpl()),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) =>
              AuthenticationBloc(AuthenticationRepository()),
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
            '/BabyDetails': (context) => BabyAssessments(),
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

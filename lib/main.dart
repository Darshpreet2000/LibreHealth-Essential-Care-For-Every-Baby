import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:newborn_care/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:newborn_care/bloc/list_of_babies_bloc/list_of_babies_bloc.dart';
import 'package:newborn_care/bloc/user_activity_bloc/user_activity_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/user_activity.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/authentication_repository.dart';
import 'package:newborn_care/repository/list_of_babies_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/repository/register_baby_repository.dart';
import 'package:newborn_care/screens/baby_assessments/baby_assessments.dart';
import 'package:newborn_care/screens/base/base_class.dart';
import 'package:newborn_care/screens/facility_login/facility_login.dart';
import 'package:newborn_care/screens/individual_login/individual_login.dart';
import 'package:newborn_care/screens/initial_screen/initial_screen.dart';
import 'package:newborn_care/screens/register_a_baby/register_a_baby.dart';
import 'package:newborn_care/theme/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synchronized/synchronized.dart';

import 'bloc/assessments_bloc/bloc/assessments_bloc.dart';
import 'bloc/refresh_bloc/refresh_bloc.dart';
import 'bloc/register_baby_bloc/register_baby_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'models/network_request.dart';
import 'repository/user_activity_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHive();
  runApp(MyApp());
}

GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();
final navigatorKey = GlobalKey<NavigatorState>();
late Box box;
late Box<List> listBox;
late Box<ChildModel> mapBox;
var lock = new Lock();
Future registerHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(NetworkRequestAdapter());
  Hive.registerAdapter(UserActivityAdapter());
  Hive.registerAdapter(ChildModelAdapter());
  Hive.registerAdapter(RequestServiceTypeAdapter());
  Hive.registerAdapter(Stage1Adapter());
  box = await Hive.openBox('eceb');
  listBox = await Hive.openBox<List>('eceblist');
  mapBox = await Hive.openBox<ChildModel>('ecebMap');
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
    NotificationRepository.intialize();
    AwesomeNotifications().actionStream.listen((receivedNotification) {
      ChildModel childModel = HiveStorageRepository()
          .getSingleChild(receivedNotification.id.toString());
      navigatorKey.currentState!.push(MaterialPageRoute(
          builder: (context) => BabyAssessments(
              childModel,
              AssessmentsBloc(
                  NotificationRepository(navigatorKey.currentContext!),
                  AssessmentsRepository(navigatorKey.currentContext!, lock),
                  childModel,
                  HiveStorageRepository()))));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

    return MultiBlocProvider(
      child: Center(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Newborn Care',
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('hi', ''), // Hindi, no country code
            const Locale('ar', ''), // Arabic, no country code
            const Locale('de', ''), // German, no country code
          ],
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
      providers: [
        BlocProvider<ListOfBabiesBloc>(
          create: (BuildContext context) => ListOfBabiesBloc(
              ListOfBabiesRepository(navigatorKey.currentContext!, lock),
              HiveStorageRepository()),
        ),
        BlocProvider<UserActivityBloc>(
          create: (BuildContext context) => UserActivityBloc(
              UserActivityRepository(navigatorKey.currentContext!, lock),
              HiveStorageRepository()),
        ),
        BlocProvider<RefreshBloc>(
          create: (BuildContext context) => RefreshBloc(
              RefreshRepository(navigatorKey.currentContext!), lock),
        ),
        BlocProvider<RegisterBabyBloc>(
          create: (BuildContext context) => RegisterBabyBloc(
              RegisterBabyModel(),
              RegisterBabyRepositoryImpl(navigatorKey.currentContext!),
              NotificationRepository(navigatorKey.currentContext!)),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
              AuthenticationRepository(navigatorKey.currentContext!),
              HiveStorageRepository()),
        ),
      ],
    );
  }
}

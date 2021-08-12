import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/notification_bloc/notification_bloc.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_screen_repository.dart';

import 'notification_bloc_test.mocks.dart';

@GenerateMocks([NotificationScreenRepository, HiveStorageRepository])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockNotifcationScreenRepo = MockNotificationScreenRepository();
  //Flutter Notifcation BloC test
  //Test Cases

  // yield NotificationLoaded on Fetch Nofitication Of Babies

  group('NotifcationBloc testing', () {
    List<OnCallDoctorModel> list = [];
    blocTest<NotificationBloc, NotificationState>(
      'yields NotificationLoaded on successful fetching of data',
      build: () {
        list.add(OnCallDoctorModel("onCallDoctorName", DateTime.now(),
            DateTime.now(), DateTime.now(), "eventID"));
        NotificationBloc notificationBloc =
            new NotificationBloc(_mockNotifcationScreenRepo);
        when(_mockNotifcationScreenRepo.fetchMonitoringAlerts())
            .thenAnswer((realInvocation) => []);
        when(_mockNotifcationScreenRepo.fetchRiskAssessmentsList())
            .thenAnswer((realInvocation) => []);
        return notificationBloc;
      },
      act: (bloc) => bloc.add(FetchNofiticationOfBabies()),
      expect: () => [isA<NotificationLoading>(), isA<NotificationLoaded>()],
    );
  });
}

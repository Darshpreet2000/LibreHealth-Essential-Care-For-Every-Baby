import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/on_call_doctor_bloc/on_call_doctor_bloc.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/on_call_doctor_repository.dart';

import 'on_call_bloc_test.mocks.dart';

@GenerateMocks([OnCallDoctorRepository, HiveStorageRepository])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockOnCallDoctorRepo = MockOnCallDoctorRepository();
  final _mockHive = MockHiveStorageRepository();
  //Flutter Summary BloC test
  //Test Cases

  // yield OnCallDoctorLoaded on successful fetching of data
  // yields OnCallDoctorLoaded on unsuccessful fetching of data by getting from hive

  group('OnCallDoctorBloc testing', () {
    List<OnCallDoctorModel> list = [];
    blocTest<OnCallDoctorBloc, OnCallDoctorState>(
      'yields OnCallDoctorLoaded on successful fetching of data',
      build: () {
        list.add(OnCallDoctorModel("onCallDoctorName", DateTime.now(),
            DateTime.now(), DateTime.now(), "eventID"));
        OnCallDoctorBloc onCallDoctorBloc =
            new OnCallDoctorBloc(_mockOnCallDoctorRepo, _mockHive);
        when(_mockOnCallDoctorRepo.getListOfOnCallDoctors())
            .thenAnswer((realInvocation) => Future.value(list));
        return onCallDoctorBloc;
      },
      act: (bloc) => bloc.add(FetchOnCallDoctors()),
      expect: () => [isA<OnCallDoctorLoading>(), isA<OnCallDoctorLoaded>()],
    );

    blocTest<OnCallDoctorBloc, OnCallDoctorState>(
      'yields OnCallDoctorLoaded on unsuccessful fetching of data',
      build: () {
        OnCallDoctorBloc onCallDoctorBloc =
            new OnCallDoctorBloc(_mockOnCallDoctorRepo, _mockHive);
        when(_mockOnCallDoctorRepo.getListOfOnCallDoctors())
            .thenThrow(SocketException("message"));
        list.add(OnCallDoctorModel("onCallDoctorName", DateTime.now(),
            DateTime.now(), DateTime.now(), "eventID"));
        when(_mockHive.getOnCallDoctors()).thenReturn(list);
        when(_mockOnCallDoctorRepo.seperateDoctorsOnCall(list))
            .thenReturn(list);
        return onCallDoctorBloc;
      },
      act: (bloc) => bloc.add(FetchOnCallDoctors()),
      expect: () => [isA<OnCallDoctorLoading>(), isA<OnCallDoctorLoaded>()],
    );
  });
}

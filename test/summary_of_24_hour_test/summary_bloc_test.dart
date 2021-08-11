import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/summary_bloc/summary_bloc.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/summary_repository.dart';
import 'package:test/test.dart';

import 'summary_bloc_test.mocks.dart';

@GenerateMocks([
  SummaryRepository,
  HiveStorageRepository,
])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockHiveRepo = MockHiveStorageRepository();
  final _mockSummaryRepo = MockSummaryRepository();

  //Flutter Summary BloC test
  //Test Cases

  // yield SummaryInitial on successful fetching of data
  // yields SummaryInitial on unsuccessful fetching of data with all values as 0

  group('AssessmentsBloc testing', () {
    blocTest<SummaryBloc, SummaryState>(
      'yields AssessmentsInitial on successful fetching of data',
      build: () {
        SummaryBloc summaryBloc =
            new SummaryBloc(_mockSummaryRepo, _mockHiveRepo);
        when(_mockSummaryRepo.fetchSummaryOf24Hours())
            .thenAnswer((realInvocation) => Future.value([0, 0, 0]));
        when(_mockHiveRepo.saveSummaryOf24Hours([0, 0, 0])).thenReturn(null);
        return summaryBloc;
      },
      act: (bloc) => bloc.add(FetchSummaryOf24Hours()),
      expect: () => [SummaryInitial(0, 0, 0)],
    );
    blocTest<SummaryBloc, SummaryState>(
      'yields SummaryInitial on unsuccessful fetching of data with all values as 0',
      build: () {
        SummaryBloc summaryBloc =
            new SummaryBloc(_mockSummaryRepo, _mockHiveRepo);
        when(_mockSummaryRepo.fetchSummaryOf24Hours())
            .thenThrow(SocketException("message"));
        when(_mockHiveRepo.getSummaryOf24Hours()).thenReturn([0, 0, 0]);
        return summaryBloc;
      },
      act: (bloc) => bloc.add(FetchSummaryOf24Hours()),
      expect: () => [SummaryInitial(0, 0, 0)],
    );
  });
}

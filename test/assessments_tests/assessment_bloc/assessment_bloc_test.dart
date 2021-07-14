import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/assessments_bloc/bloc/assessments_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import 'assessment_bloc_test.mocks.dart';


@GenerateMocks([
  AssessmentsRepository,
  NotificationRepository,
  HiveStorageRepository,
  http.Client
])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockAssessmentsRepo = MockAssessmentsRepository();
  final _mockNotificationRepo = MockNotificationRepository();
  final _mockHiveRepo = MockHiveStorageRepository();
  //Flutter Assessment BloC test
  //Test Cases
  // yield AssessmentsInitial on successful fetching of data
  // yields AssessmentsError on unsuccessful fetching of data
  // yields AssessmentsAdded on successful adding of phase 1
  // yields AssessmentsError when ward name is empty while adding of phase 1 assessments
  // yields AssessmentsError when assessments are not completed while adding of phase 1 assessments
  group('AssessmentsBloc testing', () {
    ChildModel inputChildModel = new ChildModel(
        "Oni", "postnatal", 1, 1234, 1234, DateTime.now(), "1234", "1234");
    ChildModel outputChildModel = new ChildModel(
        "Oni", "postnatal", 1, 1234, 1234, DateTime.now(), "1234", "1234");
    outputChildModel.assessmentsList = [Stage1()];
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsInitial on successful fetching of data',
      build: () {
        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        List<Object> objectList = [];
        when(_mockAssessmentsRepo.fetchAssessments(inputChildModel.key))
            .thenAnswer(
          (_) async => Future.value(objectList),
        );

        when(_mockAssessmentsRepo
                .addNextAssessment(inputChildModel.assessmentsList))
            .thenReturn([Stage1()]);
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventFetchData()),
      expect: () =>
          [AssessmentsLoading(inputChildModel), AssessmentsInitial(outputChildModel)],
    );
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError on unsuccessful fetching of data',
      build: () {
        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.fetchAssessments(inputChildModel.key))
            .thenThrow(Exception("No Internet"));

        when(_mockAssessmentsRepo
                .addNextAssessment(inputChildModel.assessmentsList))
            .thenReturn([Stage1()]);
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventFetchData()),
      expect: () => [
        AssessmentsLoading(inputChildModel),
        AssessmentsError("Exception: No Internet"),
        AssessmentsInitial(inputChildModel)
      ],
    );
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsAdded on successful adding of phase 1',
      build: () {
        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        inputChildModel.assessmentsList = [Stage1()];
        when(_mockAssessmentsRepo.validatePhase1Assessments(
                inputChildModel.assessmentsList[0] as Stage1))
            .thenAnswer((realInvocation) {
          return;
        });

        when(_mockNotificationRepo
                .removeScheduledNotification(inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());
        when(_mockAssessmentsRepo
                .addNextAssessment(inputChildModel.assessmentsList))
            .thenReturn([Stage1()]);

        when(_mockAssessmentsRepo.registerStage1Details(
                inputChildModel.assessmentsList[0] as Stage1,
                inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockHiveRepo.updateChild(inputChildModel.key, inputChildModel))
            .thenAnswer((realInvocation) {
          return;
        });

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventAddStage1()),
      expect: () => [AssessmentsAdded(inputChildModel)],
    );
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError when ward name is empty while adding of phase 1 assessments',
      build: () {
        inputChildModel.assessmentsList = [Stage1()];

        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.validatePhase1Assessments(
                inputChildModel.assessmentsList[0] as Stage1))
            .thenThrow(Exception("Exception: Enter ward name"));
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventAddStage1()),
      expect: () => [
        AssessmentsError("Exception: Enter ward name"),
        AssessmentsInitial(inputChildModel)
      ],
    );
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError when assessments are not completed while adding of phase 1 assessments',
      build: () {
        inputChildModel.assessmentsList = [Stage1()];

        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.validatePhase1Assessments(
                inputChildModel.assessmentsList[0] as Stage1))
            .thenThrow(Exception("Exception: Please complete assessments"));
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventAddStage1()),
      expect: () => [
        AssessmentsError("Exception: Please complete assessments"),
        AssessmentsInitial(inputChildModel)
      ],
    );
  });
}

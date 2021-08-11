import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/models/stage_3_danger.dart';
import 'package:newborn_care/models/stage_4.dart';
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

  // Stage - 1

  // yields AssessmentsAdded on successful adding of phase 1
  // yields AssessmentsError when ward name is empty while adding of phase 1 assessments
  // yields AssessmentsError when assessments are not completed while adding of phase 1 assessments

  // Stage - 2

  // yields AssessmentsAdded on successful adding of phase 2
  // yields AssessmentsError when ward name is empty while adding of phase 2 assessments
  // yields AssessmentsError when assessments are not completed while adding of phase 2 assessments

  // Stage - 3

  // yields AssessmentsAdded on successful adding of phase 3
  // yields AssessmentsError when assessments are incomplete while adding of phase 3 assessments

  // Stage - 4

  // yields AssessmentsAdded on successful adding of phase 4
  // yields AssessmentsError when assessments are incomplete while adding of phase 4 assessments
  group('AssessmentsBloc testing', () {
    ChildModel inputChildModel = new ChildModel("Oni", "postnatal", 1, 1234,
        1234, DateTime.now(), "1234", "1234", 'None', 1, 'normal');
    ChildModel outputChildModel = new ChildModel("Oni", "postnatal", 1, 1234,
        1234, DateTime.now(), "1234", "1234", 'None', 1, 'normal');
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

        when(_mockAssessmentsRepo.addNextAssessment(inputChildModel))
            .thenReturn([Stage1()]);
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventFetchData()),
      expect: () => [isA<AssessmentsLoading>(), isA<AssessmentsInitial>()],
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

        when(_mockAssessmentsRepo.addNextAssessment(inputChildModel))
            .thenReturn([Stage1()]);
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventFetchData()),
      expect: () => [
        isA<AssessmentsLoading>(),
        isA<AssessmentsError>(),
        isA<AssessmentsInitial>()
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
        when(_mockAssessmentsRepo.addNextAssessment(inputChildModel))
            .thenReturn([Stage1()]);

        when(_mockAssessmentsRepo.registerStageDetails(
                inputChildModel.assessmentsList[0] as Stage1,
                inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockAssessmentsRepo.updateTrackedEntityInstance(
                inputChildModel,
                inputChildModel.key,
                (inputChildModel.assessmentsList[0] as Stage1).ecebWardName))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockHiveRepo.updateChild(inputChildModel.key, inputChildModel))
            .thenAnswer((realInvocation) {
          return;
        });

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage1()),
      expect: () => [isA<AssessmentsAdded>()],
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
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage1()),
      expect: () => [isA<AssessmentsError>(), isA<AssessmentsInitial>()],
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
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage1()),
      expect: () => [isA<AssessmentsError>(), isA<AssessmentsInitial>()],
    );

    /// Stage - 2  Bloc Test

    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsAdded on successful adding of phase 2',
      build: () {
        Stage2 stage2 = new Stage2();
        stage2.ecebWardName = "postnatal";
        stage2.ecebStage2PreventDiseaseVitaminK = true;
        stage2.ecebStage2PreventDiseaseCordCare = true;
        stage2.ecebStage2PreventDiseaseEyeCare = true;
        stage2.ecebExaminationHead = true;
        stage2.ecebExaminationGenitalia = true;
        stage2.ecebExaminationEyes = true;
        stage2.ecebExaminationAnus = true;
        stage2.ecebExaminationEarsNoseThroat = true;
        stage2.ecebExaminationMuscoskeletal = true;
        stage2.ecebExaminationChest = true;
        stage2.ecebExaminationNeurology = true;
        stage2.ecebExaminationCardiovascular = true;
        stage2.ecebExaminationSkin = true;
        stage2.ecebExaminationAbdomen = true;
        stage2.ecebExaminationOverall = true;
        stage2.ecebFastBreathing = true;
        stage2.ecebChestIndrawing = true;
        stage2.ecebFeedingProperly = true;
        stage2.ecebConvulsions = true;
        stage2.ecebSevereJaundice = true;
        inputChildModel.assessmentsList = [Stage1(), stage2];
        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.validatePhase2Assessments(
                inputChildModel.assessmentsList[1] as Stage2,
                DateTime.now().subtract(Duration(minutes: 70))))
            .thenAnswer((realInvocation) {
          return;
        });

        when(_mockNotificationRepo
                .removeScheduledNotification(inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockAssessmentsRepo.classifyHealthAfterStage2(
                inputChildModel.assessmentsList[1] as Stage2))
            .thenReturn("Normal");
        when(_mockAssessmentsRepo
                .changeColorBasedOnClassification(inputChildModel))
            .thenAnswer((realInvocation) {});

        when(_mockAssessmentsRepo.addNextAssessment(inputChildModel))
            .thenReturn([Stage1(), stage2]);

        when(_mockAssessmentsRepo.registerStageDetails(
                inputChildModel.assessmentsList[1] as Stage2,
                inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockAssessmentsRepo.updateTrackedEntityInstance(
                inputChildModel,
                inputChildModel.key,
                (inputChildModel.assessmentsList[1] as Stage2).ecebWardName))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockHiveRepo.updateChild(inputChildModel.key, inputChildModel))
            .thenAnswer((realInvocation) {
          return;
        });

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage2()),
      expect: () => [isA<AssessmentsAdded>()],
    );
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError when ward name is empty while adding of phase 2 assessments',
      build: () {
        inputChildModel.assessmentsList = [Stage1(), Stage2()];

        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.validatePhase2Assessments(
                inputChildModel.assessmentsList[1] as Stage2,
                DateTime.now().subtract(Duration(minutes: 70))))
            .thenThrow(Exception("Exception: Enter ward name"));
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage1()),
      expect: () => [isA<AssessmentsError>(), isA<AssessmentsInitial>()],
    );
    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError when assessments are not completed while adding of phase 2 assessments',
      build: () {
        inputChildModel.assessmentsList = [Stage1(), Stage2()];

        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.validatePhase2Assessments(
                inputChildModel.assessmentsList[1] as Stage2,
                DateTime.now().subtract(Duration(minutes: 70))))
            .thenThrow(Exception("Exception: Please complete assessments"));
        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage1()),
      expect: () => [isA<AssessmentsError>(), isA<AssessmentsInitial>()],
    );

    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsAdded on successful adding of phase 3',
      build: () {
        Stage3Danger stage3 = new Stage3Danger();
        stage3.ecebStage3GiveAntibiotics = true;
        stage3.ecebStage3SeekAdvancedCare = true;

        inputChildModel.assessmentsList = [Stage1(), Stage2(), stage3];
        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo
                .validatePhase3Assessments(inputChildModel.assessmentsList[2]))
            .thenAnswer((realInvocation) {
          return;
        });

        when(_mockNotificationRepo
                .removeScheduledNotification(inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockAssessmentsRepo.addNextAssessment(inputChildModel))
            .thenReturn([Stage1(), Stage2(), stage3]);

        when(_mockAssessmentsRepo.registerStageDetails(
                inputChildModel.assessmentsList[2], inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockHiveRepo.updateChild(inputChildModel.key, inputChildModel))
            .thenAnswer((realInvocation) {
          return;
        });

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage3()),
      expect: () => [isA<AssessmentsAdded>()],
    );

    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError when assessments are incomplete while adding of phase 3 assessments',
      build: () {
        inputChildModel.assessmentsList = [Stage1(), Stage2(), Stage3Danger()];

        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage3()),
      expect: () => [isA<AssessmentsError>(), isA<AssessmentsInitial>()],
    );

    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsAdded on successful adding of phase 4',
      build: () {
        Stage4 stage4 = new Stage4();
        stage4.ecebFastBreathing = true;
        stage4.ecebChestIndrawing = true;
        stage4.ecebFeedingProperly = true;
        stage4.ecebConvulsions = true;
        stage4.ecebSevereJaundice = true;

        inputChildModel.assessmentsList = [
          Stage1(),
          Stage2(),
          Stage3Danger(),
          stage4
        ];
        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);
        when(_mockAssessmentsRepo.validatePhase4Assessments(
                inputChildModel.assessmentsList[3] as Stage4,
                DateTime.now().subtract(Duration(minutes: 185))))
            .thenAnswer((realInvocation) {
          return;
        });

        when(_mockNotificationRepo
                .removeScheduledNotification(inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockAssessmentsRepo.addNextAssessment(inputChildModel))
            .thenReturn(inputChildModel.assessmentsList);

        when(_mockAssessmentsRepo.registerStageDetails(
                inputChildModel.assessmentsList[3], inputChildModel.key))
            .thenAnswer((realInvocation) => Future.value());

        when(_mockHiveRepo.updateChild(inputChildModel.key, inputChildModel))
            .thenAnswer((realInvocation) {
          return;
        });

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage4()),
      expect: () => [isA<AssessmentsAdded>()],
    );

    blocTest<AssessmentsBloc, AssessmentsState>(
      'yields AssessmentsError when assessments are incomplete while adding of phase 4 assessments',
      build: () {
        inputChildModel.assessmentsList = [
          Stage1(),
          Stage2(),
          Stage3Danger(),
          Stage4()
        ];

        AssessmentsBloc assessmentsBloc = new AssessmentsBloc(
            _mockNotificationRepo,
            _mockAssessmentsRepo,
            inputChildModel,
            _mockHiveRepo);

        return assessmentsBloc;
      },
      act: (bloc) => bloc.add(AssessmentsEventCompleteStage4()),
      expect: () => [isA<AssessmentsError>(), isA<AssessmentsInitial>()],
    );
  });
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/models/stage_4.dart';
import 'package:newborn_care/models/stage_5.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
part 'assessments_event.dart';
part 'assessments_state.dart';

class AssessmentsBloc extends Bloc<AssessmentsEvent, AssessmentsState> {
  AssessmentsRepository _assessmentsRepository;
  HiveStorageRepository hiveStorageRepository;
  NotificationRepository notificationRepository;
  ChildModel childModel;
  AssessmentsBloc(this.notificationRepository, this._assessmentsRepository,
      this.childModel, this.hiveStorageRepository)
      : super(AssessmentsInitial(childModel));

  @override
  Stream<AssessmentsState> mapEventToState(
    AssessmentsEvent event,
  ) async* {
    if (event is AssessmentsEventFetchData) {
      yield AssessmentsLoading(childModel);
      try {
        childModel.assessmentsList =
            await _assessmentsRepository.fetchAssessments(childModel.key);
        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsInitial(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    } else if (event is AssessmentsEventCompleteStage1) {
      try {
        // check if data is filled correctly
        _assessmentsRepository
            .validatePhase1Assessments(childModel.assessmentsList[0] as Stage1);
        //remove scheduled notifications
        notificationRepository.removeScheduledNotification(childModel.key);
        //push data to dhis2 using api
        _assessmentsRepository.registerStageDetails(
            childModel.assessmentsList[0], childModel.key);

        // add next stage assessments
        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);
        //update Tracked Entity Instance
        _assessmentsRepository.updateTrackedEntityInstance(
            childModel,
            childModel.key,
            (childModel.assessmentsList[0] as Stage1).ecebWardName);
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsAdded(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    } else if (event is AssessmentsEventCompleteStage2) {
      try {
        // check if data is filled correctly
        _assessmentsRepository.validatePhase2Assessments(
            childModel.assessmentsList[1] as Stage2, childModel.birthTime);

        notificationRepository.removeScheduledNotification(childModel.key);
        //push data to dhis2 using api
        _assessmentsRepository.registerStageDetails(
            childModel.assessmentsList[1], childModel.key);
        //classify baby
        childModel.classification = _assessmentsRepository
            .classifyHealthAfterStage2(childModel.assessmentsList[1] as Stage2);
        //change color based on classification
        _assessmentsRepository.changeColorBasedOnClassification(childModel);
        // add next stage assessments
        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);

        //update Tracked Entity Instance & push to dhis2
        _assessmentsRepository.updateTrackedEntityInstance(
            childModel,
            childModel.key,
            (childModel.assessmentsList[1] as Stage2).ecebWardName);

        //update child data in local storage in phone
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsAdded(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    } else if (event is AssessmentsEventCompleteStage3) {
      try {
        // check if data is filled correctly
        _assessmentsRepository
            .validatePhase3Assessments(childModel.assessmentsList[event.index]);

        notificationRepository.removeScheduledNotification(childModel.key);
        //push data to dhis2 using api
        _assessmentsRepository.registerStageDetails(
            childModel.assessmentsList[event.index], childModel.key);

        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);

        //update child data in local storage in phone
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsAdded(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    } else if (event is AssessmentsEventCompleteStage4) {
      try {
        // check if data is filled correctly
        _assessmentsRepository.validatePhase4Assessments(
            childModel.assessmentsList[event.index] as Stage4);

        notificationRepository.removeScheduledNotification(childModel.key);
        //push data to dhis2 using api
        _assessmentsRepository.registerStageDetails(
            childModel.assessmentsList[event.index], childModel.key);
        //classify baby
        childModel.classification =
            _assessmentsRepository.classifyHealthAfterStage4(
                childModel.assessmentsList[event.index] as Stage4);
        //change color based on classification
        _assessmentsRepository.changeColorBasedOnClassification(childModel);
        // add next stage assessments
        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);

        //update Tracked Entity Instance & push to dhis2
        _assessmentsRepository.updateTrackedEntityInstance(
            childModel,
            childModel.key,
            (childModel.assessmentsList[1] as Stage2).ecebWardName);

        //update child data in local storage in phone
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsAdded(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    } else if (event is DischargeButtonClick) {
      childModel.assessmentsList =
          _assessmentsRepository.removeLastUncompletedAssessment(childModel);
      notificationRepository.removeScheduledNotification(childModel.key);

      childModel.assessmentsList =
          _assessmentsRepository.addDischargeAssessments(childModel);
      hiveStorageRepository.updateChild(childModel.key, childModel);
      yield AssessmentsInitial(childModel);
    } else if (event is AssessmentsEventCompleteStage5) {
      try {
        // check if data is filled correctly
        _assessmentsRepository.validatePhase5Assessments(
            childModel.assessmentsList.last as Stage5);
        //mark child as discharged
        childModel.isCompleted = true;
        //push data to dhis2 using api
        _assessmentsRepository.registerStageDetails(
            childModel.assessmentsList.last, childModel.key);
        //mark enrollment as completed
        _assessmentsRepository.updateEnrollmentStatus(childModel.key);
        //update child data in local storage in phone
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsAdded(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    }
  }
}

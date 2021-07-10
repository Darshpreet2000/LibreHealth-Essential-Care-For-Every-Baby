import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
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

        notificationRepository.removeScheduledNotification(childModel.key);
        //push data to dhis2 using api
        _assessmentsRepository.registerStage1Details(
            childModel.assessmentsList[0] as Stage1, childModel.key);
        // add next stage assessments
        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);

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
        _assessmentsRepository.registerStage2Details(
            childModel.assessmentsList[1] as Stage2, childModel.key);
        // add next stage assessments
        childModel.assessmentsList =
            _assessmentsRepository.addNextAssessment(childModel);
        hiveStorageRepository.updateChild(childModel.key, childModel);
        yield AssessmentsAdded(childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    }
  }
}

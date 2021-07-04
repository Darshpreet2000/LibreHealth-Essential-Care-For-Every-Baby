import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
part 'assessments_event.dart';
part 'assessments_state.dart';

class AssessmentsBloc extends Bloc<AssessmentsEvent, AssessmentsState> {
  AssessmentsRepository _assessmentsRepository;
  HiveStorageRepository hiveStorageRepository;
  ChildModel childModel;
  AssessmentsBloc(
      this._assessmentsRepository, this.childModel, this.hiveStorageRepository)
      : super(AssessmentsInitial(childModel));

  @override
  Stream<AssessmentsState> mapEventToState(
    AssessmentsEvent event,
  ) async* {
    if (event is AssessmentsEventAddStage1) {
      try {
        // check if data is filled correctly
        _assessmentsRepository
            .validatePhase1Assessments(childModel.assessmentsList[0] as Stage1);
        //push data to dhis2 using api
        _assessmentsRepository.registerStage1Details(
            childModel.assessmentsList[0] as Stage1,
            childModel.trackedEntityID);
        hiveStorageRepository.updateChild(childModel.key, childModel);
      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(childModel);
      }
    }
  }
}

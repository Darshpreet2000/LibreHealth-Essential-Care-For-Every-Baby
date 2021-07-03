import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
part 'assessments_event.dart';
part 'assessments_state.dart';

class AssessmentsBloc extends Bloc<AssessmentsEvent, AssessmentsState> {
  AssessmentsRepository _assessmentsRepository;
  List<Object> assessmentsModelList;
  AssessmentsBloc(this._assessmentsRepository, this.assessmentsModelList)
      : super(AssessmentsInitial(assessmentsModelList));

  @override
  Stream<AssessmentsState> mapEventToState(
    AssessmentsEvent event,
  ) async* {
    if (event is AssessmentsEventAddStage1) {
      try {
        // check if data is filled correctly
        _assessmentsRepository
            .validatePhase1Assessments(assessmentsModelList[0] as Stage1);
        //push data to dhis2 using api

      } catch (e) {
        yield AssessmentsError(e.toString());
        yield AssessmentsInitial(assessmentsModelList);
      }
    }
  }
}

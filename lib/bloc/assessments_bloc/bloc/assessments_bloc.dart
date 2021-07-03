import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_1.dart';

part 'assessments_event.dart';
part 'assessments_state.dart';

class AssessmentsBloc extends Bloc<AssessmentsEvent, AssessmentsState> {
  AssessmentsBloc() : super(AssessmentsInitial());

  @override
  Stream<AssessmentsState> mapEventToState(
    AssessmentsEvent event,
  ) async* {
     if(event is AssessmentsEventAddStage1){
       
     }
  }
}

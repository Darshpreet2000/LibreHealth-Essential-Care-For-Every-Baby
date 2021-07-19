import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/summary_repository.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryRepository summaryRepository;
  HiveStorageRepository hiveStorageRepository;
  SummaryBloc(this.summaryRepository, this.hiveStorageRepository)
      : super(SummaryInitial(0,0,0));

  @override
  Stream<SummaryState> mapEventToState(
    SummaryEvent event,
  ) async* {
    if (event is FetchSummaryOf24Hours) {
      try {
        var res = await summaryRepository.fetchSummaryOf24Hours();
        yield SummaryInitial(res[0], res[1], res[2]);
      } catch (e) {
        List<int> list = hiveStorageRepository.getSummaryOf24Hours();
        yield SummaryInitial(list[0], list[1], list[2]);
      }
    }
  }
}

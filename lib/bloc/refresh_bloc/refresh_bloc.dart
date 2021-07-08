import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';
part 'refresh_event.dart';
part 'refresh_state.dart';

class RefreshBloc extends Bloc<RefreshEvent, RefreshState> {
  RefreshRepository refreshRepository;
  Lock lock;
  RefreshBloc(this.refreshRepository, this.lock) : super(RefreshInitial());

  @override
  Stream<RefreshState> mapEventToState(
    RefreshEvent event,
  ) async* {
    if (event is RefreshEventStart) {
      yield RefreshLoading();
      try {
        await lock.synchronized(refreshRepository.startRefreshing);
        yield RefreshLoaded();
      } catch (e) {
        yield RefreshError(e.toString());
      }
    }
  }
}

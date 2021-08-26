import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/authentication_repository.dart';
import 'package:newborn_care/repository/program_rule_repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  ProgramRuleRepository programRuleRepository;
  HiveStorageRepository hiveStorageRepository;
  AuthenticationBloc(this.authenticationRepository, this.hiveStorageRepository,
      this.programRuleRepository)
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationLoginEvent) {
      yield AuthenticationLoading();
      try {
        Profile profile = await authenticationRepository.loginUser(
            event.username, event.password, event.server,event.orgUnit);
        hiveStorageRepository.storeProfile(profile);
        yield AuthenticationLoaded();
        programRuleRepository.updateProgramRules();
      } catch (e) {
        yield AuthenticationError(e.toString());
      }
    }
  }
}

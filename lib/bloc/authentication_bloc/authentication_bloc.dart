import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/repository/HiveStorageRepository.dart';
import 'package:newborn_care/repository/authentication_repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  HiveStorageRepository hiveStorageRepository;
  AuthenticationBloc(this.authenticationRepository,this.hiveStorageRepository)
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationLoginEvent) {
      yield AuthenticationLoading();
      try {
           Profile profile = await authenticationRepository.loginUser(
            event.username, event.password);
          hiveStorageRepository.storeProfile(profile);
        
        yield AuthenticationLoaded();
      } catch (e) {
        yield AuthenticationError(e.toString());
      }
    }
  }
}

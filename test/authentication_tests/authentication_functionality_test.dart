import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/authentication_client.dart';
import 'dart:convert';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/authentication_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'authentication_functionality_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, HiveStorageRepository, http.Client])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockAuthRepo = MockAuthenticationRepository();
  final _mockHiveRepo = MockHiveStorageRepository();
  final _mockHttpClient = MockClient();
  //hive storage repo test two cases
  // 1. User loggedIn return true
  // 2. Not LoggedIn return false
  group('hive storage logging testing', () {
    test('returns false if user is not loggedIn', () {
      when(_mockHiveRepo.checkUserLoggedIn()).thenAnswer((invocation) => false);

      expect(_mockHiveRepo.checkUserLoggedIn(), false);
    });
    test('returns true if user is loggedIn', () {
      when(_mockHiveRepo.checkUserLoggedIn()).thenAnswer((invocation) => true);

      expect(_mockHiveRepo.checkUserLoggedIn(), true);
    });
  });
  //Flutter BloC test
  //2 cases
  // yield AuthenticationLoaded on successful login
  // yield AuthenticationError on unsuccessful login
  group('AuthenticationBloc Logging testing', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'yields AuthenticationLoaded on successful user logged In',
      build: () {
        AuthenticationBloc authenticationBloc =
            new AuthenticationBloc(_mockAuthRepo, _mockHiveRepo);

        when(_mockAuthRepo.loginUser("testuser", "Admin@123")).thenAnswer(
          (_) async =>
              Future.value(Profile("testuser", "id", "testuser", "Admin@123")),
        );

        when(_mockHiveRepo.storeProfile(
                Profile("testuser", "id", "testuser", "Admin@123")))
            .thenReturn(null);
        return authenticationBloc;
      },
      act: (bloc) =>
          bloc.add(AuthenticationLoginEvent("testuser", "Admin@123")),
      expect: () => [AuthenticationLoading(), AuthenticationLoaded()],
    );
    blocTest<AuthenticationBloc, AuthenticationState>(
      'yields AuthenticationError on unsuccessful user log In',
      build: () {
        AuthenticationBloc authenticationBloc =
            new AuthenticationBloc(_mockAuthRepo, _mockHiveRepo);

        when(_mockAuthRepo.loginUser("testuser", "Admin@123"))
            .thenThrow(Exception("No internet connection"));

        return authenticationBloc;
      },
      act: (bloc) =>
          bloc.add(AuthenticationLoginEvent("testuser", "Admin@123")),
      expect: () => [
        AuthenticationLoading(),
        AuthenticationError("Exception:No internet connection")
      ],
    );
  });
  //Auth Client Testing
  group('auth client logging testing', () {
    Map<String, String> m = new Map();
    m.addAll({
      "noInternetConnection": "No internet connection",
      "errorDuringCommunication": "Error during communication",
      "invalidRequest": "Invalid request",
      "unauthorised": "Unauthorized",
      "invalidInput": "Invalid input"
    });

    http.Response loggedInResponse = new http.Response(
        '{"lastUpdated": "2021-06-14T06:56:05.625","id": "PzZ2sAIHvUU", "name": "Test User","displayName": "Test User",}',
        200);
    http.Response unSuccessfulLoggedInResponse = new http.Response(
        '{"lastUpdated": "2021-06-14T06:56:05.625","id": "PzZ2sAIHvUU", "name": "Test User","displayName": "Test User",}',
        401);

    var loggedInResponseJson = loggedInResponse.body.toString();
    test('returns response with 200 code on successful login', () async {
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('testuser:Admin@123'));
      when(_mockHttpClient.get(
        Uri.parse(DHIS2Config().serverURL + APIConfig().login),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenAnswer((_) async => loggedInResponse);

      expect(
          await AuthenticationClient(_mockHttpClient, m)
              .loginUser("testuser", "Admin@123"),
          loggedInResponseJson);
    });
    test('returns response with 401 code on login with incorrect credentials',
        () async {
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('testuser:Admin@123'));
      when(_mockHttpClient.get(
        Uri.parse(DHIS2Config().serverURL + APIConfig().login),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenAnswer((_) async => unSuccessfulLoggedInResponse);
      try {
        await AuthenticationClient(_mockHttpClient, m)
            .loginUser("testuser", "Admin@123");
        fail("exception not thrown");
      } catch (e) {
        expect(e, isA<UnauthorisedException>());
      }
    });
    test('throws FetchDataException on no internet connection on login',
        () async {
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('testuser:Admin@123'));
      when(_mockHttpClient.get(
        Uri.parse(DHIS2Config().serverURL + APIConfig().login),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenThrow(SocketException("no internet"));
      try {
        await AuthenticationClient(_mockHttpClient, m)
            .loginUser("testuser", "Admin@123");
        fail("exception not thrown");
      } catch (e) {
        expect(e, isA<FetchDataException>());
      }
    });
  });
}

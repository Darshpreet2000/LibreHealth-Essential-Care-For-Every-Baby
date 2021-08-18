// Mocks generated by Mockito 5.0.13 from annotations
// in newborn_care/test/assessments_tests/assessment_bloc/assessment_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i16;
import 'dart:convert' as _i21;
import 'dart:typed_data' as _i22;

import 'package:flutter/cupertino.dart' as _i2;
import 'package:http/http.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:newborn_care/models/child_model.dart' as _i8;
import 'package:newborn_care/models/network_request.dart' as _i20;
import 'package:newborn_care/models/on_call_doctor_model.dart' as _i17;
import 'package:newborn_care/models/profile.dart' as _i9;
import 'package:newborn_care/models/sort_list_enum.dart' as _i18;
import 'package:newborn_care/models/stage_1.dart' as _i12;
import 'package:newborn_care/models/stage_2.dart' as _i13;
import 'package:newborn_care/models/stage_4.dart' as _i14;
import 'package:newborn_care/models/stage_5.dart' as _i15;
import 'package:newborn_care/models/user_activity.dart' as _i19;
import 'package:newborn_care/network/assessments_client.dart' as _i6;
import 'package:newborn_care/repository/assessments_repository.dart' as _i11;
import 'package:newborn_care/repository/hive_storage_repository.dart' as _i4;
import 'package:newborn_care/repository/notification_repository.dart' as _i7;
import 'package:newborn_care/repository/refresh_repository.dart' as _i5;
import 'package:synchronized/synchronized.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeBuildContext extends _i1.Fake implements _i2.BuildContext {}

class _FakeLock extends _i1.Fake implements _i3.Lock {}

class _FakeHiveStorageRepository extends _i1.Fake
    implements _i4.HiveStorageRepository {}

class _FakeRefreshRepository extends _i1.Fake implements _i5.RefreshRepository {
}

class _FakeAssessmentsClient extends _i1.Fake implements _i6.AssessmentsClient {
}

class _FakeNotificationRepository extends _i1.Fake
    implements _i7.NotificationRepository {}

class _FakeChildModel extends _i1.Fake implements _i8.ChildModel {}

class _FakeProfile extends _i1.Fake implements _i9.Profile {}

class _FakeResponse extends _i1.Fake implements _i10.Response {}

class _FakeStreamedResponse extends _i1.Fake implements _i10.StreamedResponse {}

/// A class which mocks [AssessmentsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssessmentsRepository extends _i1.Mock
    implements _i11.AssessmentsRepository {
  MockAssessmentsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BuildContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeBuildContext()) as _i2.BuildContext);
  @override
  _i3.Lock get lock =>
      (super.noSuchMethod(Invocation.getter(#lock), returnValue: _FakeLock())
          as _i3.Lock);
  @override
  _i4.HiveStorageRepository get hiveStorageRepository => (super.noSuchMethod(
      Invocation.getter(#hiveStorageRepository),
      returnValue: _FakeHiveStorageRepository()) as _i4.HiveStorageRepository);
  @override
  _i5.RefreshRepository get refreshRepository =>
      (super.noSuchMethod(Invocation.getter(#refreshRepository),
          returnValue: _FakeRefreshRepository()) as _i5.RefreshRepository);
  @override
  _i6.AssessmentsClient get assessmentsClient =>
      (super.noSuchMethod(Invocation.getter(#assessmentsClient),
          returnValue: _FakeAssessmentsClient()) as _i6.AssessmentsClient);
  @override
  set assessmentsClient(_i6.AssessmentsClient? _assessmentsClient) => super
      .noSuchMethod(Invocation.setter(#assessmentsClient, _assessmentsClient),
          returnValueForMissingStub: null);
  @override
  _i7.NotificationRepository get notificationRepository =>
      (super.noSuchMethod(Invocation.getter(#notificationRepository),
              returnValue: _FakeNotificationRepository())
          as _i7.NotificationRepository);
  @override
  void validatePhase1Assessments(_i12.Stage1? stage1) => super.noSuchMethod(
      Invocation.method(#validatePhase1Assessments, [stage1]),
      returnValueForMissingStub: null);
  @override
  void validatePhase2Assessments(_i13.Stage2? stage2, DateTime? birthTime) =>
      super.noSuchMethod(
          Invocation.method(#validatePhase2Assessments, [stage2, birthTime]),
          returnValueForMissingStub: null);
  @override
  void validatePhase3Assessments(Object? obj) =>
      super.noSuchMethod(Invocation.method(#validatePhase3Assessments, [obj]),
          returnValueForMissingStub: null);
  @override
  void validatePhase4Assessments(_i14.Stage4? stage4) => super.noSuchMethod(
      Invocation.method(#validatePhase4Assessments, [stage4]),
      returnValueForMissingStub: null);
  @override
  void validatePhase5Assessments(_i15.Stage5? stage5) => super.noSuchMethod(
      Invocation.method(#validatePhase5Assessments, [stage5]),
      returnValueForMissingStub: null);
  @override
  List<Object> addNextAssessment(_i8.ChildModel? childModel) =>
      (super.noSuchMethod(Invocation.method(#addNextAssessment, [childModel]),
          returnValue: <Object>[]) as List<Object>);
  @override
  List<Object> removeLastUncompletedAssessment(_i8.ChildModel? childModel) =>
      (super.noSuchMethod(
          Invocation.method(#removeLastUncompletedAssessment, [childModel]),
          returnValue: <Object>[]) as List<Object>);
  @override
  List<Object> addDischargeAssessments(_i8.ChildModel? childModel) => (super
      .noSuchMethod(Invocation.method(#addDischargeAssessments, [childModel]),
          returnValue: <Object>[]) as List<Object>);
  @override
  void changeColorBasedOnClassification(_i8.ChildModel? childModel) =>
      super.noSuchMethod(
          Invocation.method(#changeColorBasedOnClassification, [childModel]),
          returnValueForMissingStub: null);
  @override
  _i16.Future<dynamic> registerStageDetails(Object? obj, String? id) =>
      (super.noSuchMethod(Invocation.method(#registerStageDetails, [obj, id]),
          returnValue: Future<dynamic>.value()) as _i16.Future<dynamic>);
  @override
  _i16.Future<dynamic> updateEnrollmentStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(#updateEnrollmentStatus, [key]),
          returnValue: Future<dynamic>.value()) as _i16.Future<dynamic>);
  @override
  String classifyHealthAfterStage2(_i13.Stage2? stage2) => (super.noSuchMethod(
      Invocation.method(#classifyHealthAfterStage2, [stage2]),
      returnValue: '') as String);
  @override
  String classifyHealthAfterStage4(_i14.Stage4? stage4) => (super.noSuchMethod(
      Invocation.method(#classifyHealthAfterStage4, [stage4]),
      returnValue: '') as String);
  @override
  _i16.Future<dynamic> updateTrackedEntityInstance(
          _i8.ChildModel? childModel, String? id, String? wardName) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateTrackedEntityInstance, [childModel, id, wardName]),
          returnValue: Future<dynamic>.value()) as _i16.Future<dynamic>);
  @override
  _i16.Future<dynamic> fetchAssessments(String? key) =>
      (super.noSuchMethod(Invocation.method(#fetchAssessments, [key]),
          returnValue: Future<dynamic>.value()) as _i16.Future<dynamic>);
  @override
  void addStage1Notifications(_i8.ChildModel? childModel) => super.noSuchMethod(
      Invocation.method(#addStage1Notifications, [childModel]),
      returnValueForMissingStub: null);
  @override
  void addStage2Notifications(_i8.ChildModel? childModel) => super.noSuchMethod(
      Invocation.method(#addStage2Notifications, [childModel]),
      returnValueForMissingStub: null);
  @override
  void addStage4Notifications(_i8.ChildModel? childModel, DateTime? time) =>
      super.noSuchMethod(
          Invocation.method(#addStage4Notifications, [childModel, time]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NotificationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotificationRepository extends _i1.Mock
    implements _i7.NotificationRepository {
  MockNotificationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BuildContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeBuildContext()) as _i2.BuildContext);
  @override
  _i16.Future<void> immediateNotification(
          String? key, String? motherName, String? body) =>
      (super.noSuchMethod(
          Invocation.method(#immediateNotification, [key, motherName, body]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub:
              Future<void>.value()) as _i16.Future<void>);
  @override
  _i16.Future<void> scheduledStageNotification(
          String? key, String? motherName, String? body, DateTime? date) =>
      (super.noSuchMethod(
              Invocation.method(
                  #scheduledStageNotification, [key, motherName, body, date]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i16.Future<void>);
  @override
  _i16.Future<void> scheduledStageNotificationReminder(
          String? key, String? motherName, String? body, DateTime? date) =>
      (super.noSuchMethod(
              Invocation.method(#scheduledStageNotificationReminder,
                  [key, motherName, body, date]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i16.Future<void>);
  @override
  _i16.Future<void> removeScheduledNotification(String? key) => (super
          .noSuchMethod(Invocation.method(#removeScheduledNotification, [key]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
      as _i16.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [HiveStorageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveStorageRepository extends _i1.Mock
    implements _i4.HiveStorageRepository {
  MockHiveStorageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void saveProgramRule(String? id, String? data) =>
      super.noSuchMethod(Invocation.method(#saveProgramRule, [id, data]),
          returnValueForMissingStub: null);
  @override
  String getProgramRule(String? id) =>
      (super.noSuchMethod(Invocation.method(#getProgramRule, [id]),
          returnValue: '') as String);
  @override
  bool containsProgramRule(String? id) =>
      (super.noSuchMethod(Invocation.method(#containsProgramRule, [id]),
          returnValue: false) as bool);
  @override
  void saveOrgUnit(String? org) =>
      super.noSuchMethod(Invocation.method(#saveOrgUnit, [org]),
          returnValueForMissingStub: null);
  @override
  String getOrgUnit() =>
      (super.noSuchMethod(Invocation.method(#getOrgUnit, []), returnValue: '')
          as String);
  @override
  void saveServerURL(String? server) =>
      super.noSuchMethod(Invocation.method(#saveServerURL, [server]),
          returnValueForMissingStub: null);
  @override
  String getServerURL() =>
      (super.noSuchMethod(Invocation.method(#getServerURL, []), returnValue: '')
          as String);
  @override
  void saveOnCallDoctors(List<_i17.OnCallDoctorModel>? list) =>
      super.noSuchMethod(Invocation.method(#saveOnCallDoctors, [list]),
          returnValueForMissingStub: null);
  @override
  List<_i17.OnCallDoctorModel> getOnCallDoctors() => (super.noSuchMethod(
      Invocation.method(#getOnCallDoctors, []),
      returnValue: <_i17.OnCallDoctorModel>[]) as List<_i17.OnCallDoctorModel>);
  @override
  bool getNotificationEnabled() =>
      (super.noSuchMethod(Invocation.method(#getNotificationEnabled, []),
          returnValue: false) as bool);
  @override
  void storeNotificationEnabled(bool? value) =>
      super.noSuchMethod(Invocation.method(#storeNotificationEnabled, [value]),
          returnValueForMissingStub: null);
  @override
  bool getNotificationSoundEnabled() =>
      (super.noSuchMethod(Invocation.method(#getNotificationSoundEnabled, []),
          returnValue: false) as bool);
  @override
  void storeNotificationSoundEnabled(bool? value) => super.noSuchMethod(
      Invocation.method(#storeNotificationSoundEnabled, [value]),
      returnValueForMissingStub: null);
  @override
  bool getThemeData() =>
      (super.noSuchMethod(Invocation.method(#getThemeData, []),
          returnValue: false) as bool);
  @override
  void storeThemeData(bool? value) =>
      super.noSuchMethod(Invocation.method(#storeThemeData, [value]),
          returnValueForMissingStub: null);
  @override
  _i18.SortListEnum getSortBy() =>
      (super.noSuchMethod(Invocation.method(#getSortBy, []),
          returnValue: _i18.SortListEnum.time) as _i18.SortListEnum);
  @override
  void storeSortBy(_i18.SortListEnum? sortListEnum) =>
      super.noSuchMethod(Invocation.method(#storeSortBy, [sortListEnum]),
          returnValueForMissingStub: null);
  @override
  void storeSingleChild(_i8.ChildModel? child) =>
      super.noSuchMethod(Invocation.method(#storeSingleChild, [child]),
          returnValueForMissingStub: null);
  @override
  _i16.Future<void> storeListOfChild(List<_i8.ChildModel>? childList) =>
      (super.noSuchMethod(Invocation.method(#storeListOfChild, [childList]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i16.Future<void>);
  @override
  void updateChild(String? key, _i8.ChildModel? childModel) =>
      super.noSuchMethod(Invocation.method(#updateChild, [key, childModel]),
          returnValueForMissingStub: null);
  @override
  _i8.ChildModel getSingleChild(String? key) =>
      (super.noSuchMethod(Invocation.method(#getSingleChild, [key]),
          returnValue: _FakeChildModel()) as _i8.ChildModel);
  @override
  List<_i8.ChildModel> getListOfAllChild() =>
      (super.noSuchMethod(Invocation.method(#getListOfAllChild, []),
          returnValue: <_i8.ChildModel>[]) as List<_i8.ChildModel>);
  @override
  void storeNotifications(List<_i19.UserActivity>? notificationsList) => super
      .noSuchMethod(Invocation.method(#storeNotifications, [notificationsList]),
          returnValueForMissingStub: null);
  @override
  List<_i19.UserActivity> getNotificationsList() =>
      (super.noSuchMethod(Invocation.method(#getNotificationsList, []),
          returnValue: <_i19.UserActivity>[]) as List<_i19.UserActivity>);
  @override
  void storeNetworkRequest(_i20.NetworkRequest? request) =>
      super.noSuchMethod(Invocation.method(#storeNetworkRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void storeNetworkRequestList(List<_i20.NetworkRequest>? networkRequests) =>
      super.noSuchMethod(
          Invocation.method(#storeNetworkRequestList, [networkRequests]),
          returnValueForMissingStub: null);
  @override
  List<_i20.NetworkRequest> getNetworkRequests() =>
      (super.noSuchMethod(Invocation.method(#getNetworkRequests, []),
          returnValue: <_i20.NetworkRequest>[]) as List<_i20.NetworkRequest>);
  @override
  void storeProfile(_i9.Profile? profile) =>
      super.noSuchMethod(Invocation.method(#storeProfile, [profile]),
          returnValueForMissingStub: null);
  @override
  _i9.Profile getProfile() =>
      (super.noSuchMethod(Invocation.method(#getProfile, []),
          returnValue: _FakeProfile()) as _i9.Profile);
  @override
  void markUserAsLoggedIn() =>
      super.noSuchMethod(Invocation.method(#markUserAsLoggedIn, []),
          returnValueForMissingStub: null);
  @override
  void markUserAsLoggedOut() =>
      super.noSuchMethod(Invocation.method(#markUserAsLoggedOut, []),
          returnValueForMissingStub: null);
  @override
  bool checkUserLoggedIn() =>
      (super.noSuchMethod(Invocation.method(#checkUserLoggedIn, []),
          returnValue: false) as bool);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i10.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i16.Future<_i10.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i10.Response>.value(_FakeResponse()))
          as _i16.Future<_i10.Response>);
  @override
  _i16.Future<_i10.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i10.Response>.value(_FakeResponse()))
          as _i16.Future<_i10.Response>);
  @override
  _i16.Future<_i10.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i21.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i10.Response>.value(_FakeResponse()))
          as _i16.Future<_i10.Response>);
  @override
  _i16.Future<_i10.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i21.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i10.Response>.value(_FakeResponse()))
          as _i16.Future<_i10.Response>);
  @override
  _i16.Future<_i10.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i21.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i10.Response>.value(_FakeResponse()))
          as _i16.Future<_i10.Response>);
  @override
  _i16.Future<_i10.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i21.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i10.Response>.value(_FakeResponse()))
          as _i16.Future<_i10.Response>);
  @override
  _i16.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i16.Future<String>);
  @override
  _i16.Future<_i22.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i22.Uint8List>.value(_i22.Uint8List(0)))
          as _i16.Future<_i22.Uint8List>);
  @override
  _i16.Future<_i10.StreamedResponse> send(_i10.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i10.StreamedResponse>.value(_FakeStreamedResponse()))
          as _i16.Future<_i10.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

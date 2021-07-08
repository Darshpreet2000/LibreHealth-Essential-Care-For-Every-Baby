// Mocks generated by Mockito 5.0.10 from annotations
// in newborn_care/test/assessments_tests/assessment_bloc/assessment_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i13;
import 'dart:convert' as _i18;
import 'dart:typed_data' as _i19;

import 'package:flutter/src/widgets/framework.dart' as _i2;
import 'package:http/src/base_request.dart' as _i20;
import 'package:http/src/client.dart' as _i17;
import 'package:http/src/response.dart' as _i9;
import 'package:http/src/streamed_response.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:newborn_care/models/child_model.dart' as _i7;
import 'package:newborn_care/models/network_request.dart' as _i16;
import 'package:newborn_care/models/profile.dart' as _i8;
import 'package:newborn_care/models/stage_1.dart' as _i12;
import 'package:newborn_care/models/user_activity.dart' as _i15;
import 'package:newborn_care/network/assessments_client.dart' as _i6;
import 'package:newborn_care/repository/assessments_repository.dart' as _i11;
import 'package:newborn_care/repository/hive_storage_repository.dart' as _i4;
import 'package:newborn_care/repository/notification_repository.dart' as _i14;
import 'package:newborn_care/repository/refresh_repository.dart' as _i5;
import 'package:synchronized/synchronized.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
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

class _FakeChildModel extends _i1.Fake implements _i7.ChildModel {}

class _FakeProfile extends _i1.Fake implements _i8.Profile {}

class _FakeResponse extends _i1.Fake implements _i9.Response {}

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
  void validatePhase1Assessments(_i12.Stage1? stage1) => super.noSuchMethod(
      Invocation.method(#validatePhase1Assessments, [stage1]),
      returnValueForMissingStub: null);
  @override
  List<Object> addNextAssessment(List<Object>? assessments) =>
      (super.noSuchMethod(Invocation.method(#addNextAssessment, [assessments]),
          returnValue: <Object>[]) as List<Object>);
  @override
  _i13.Future<dynamic> registerStage1Details(_i12.Stage1? stage1, String? id) =>
      (super.noSuchMethod(
          Invocation.method(#registerStage1Details, [stage1, id]),
          returnValue: Future<dynamic>.value()) as _i13.Future<dynamic>);
  @override
  _i13.Future<dynamic> fetchAssessments(String? key) =>
      (super.noSuchMethod(Invocation.method(#fetchAssessments, [key]),
          returnValue: Future<dynamic>.value()) as _i13.Future<dynamic>);
}

/// A class which mocks [NotificationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotificationRepository extends _i1.Mock
    implements _i14.NotificationRepository {
  MockNotificationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BuildContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeBuildContext()) as _i2.BuildContext);
  @override
  _i13.Future<void> showStage1Notification(String? key, String? motherName) =>
      (super.noSuchMethod(
          Invocation.method(#showStage1Notification, [key, motherName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i13.Future<void>);
  @override
  _i13.Future<void> scheduledStage1Notification(
          String? key, String? motherName) =>
      (super.noSuchMethod(
          Invocation.method(#scheduledStage1Notification, [key, motherName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i13.Future<void>);
  @override
  _i13.Future<void> removeScheduledNotification(String? key) => (super
      .noSuchMethod(Invocation.method(#removeScheduledNotification, [key]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i13.Future<void>);
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
  void storeSingleChild(_i7.ChildModel? child) =>
      super.noSuchMethod(Invocation.method(#storeSingleChild, [child]),
          returnValueForMissingStub: null);
  @override
  _i13.Future<void> storeListOfChild(List<_i7.ChildModel>? childList) =>
      (super.noSuchMethod(Invocation.method(#storeListOfChild, [childList]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i13.Future<void>);
  @override
  void updateChild(String? key, _i7.ChildModel? childModel) =>
      super.noSuchMethod(Invocation.method(#updateChild, [key, childModel]),
          returnValueForMissingStub: null);
  @override
  _i7.ChildModel getSingleChild(String? key) =>
      (super.noSuchMethod(Invocation.method(#getSingleChild, [key]),
          returnValue: _FakeChildModel()) as _i7.ChildModel);
  @override
  List<_i7.ChildModel> getListOfAllChild() =>
      (super.noSuchMethod(Invocation.method(#getListOfAllChild, []),
          returnValue: <_i7.ChildModel>[]) as List<_i7.ChildModel>);
  @override
  void storeNotifications(List<_i15.UserActivity>? notificationsList) => super
      .noSuchMethod(Invocation.method(#storeNotifications, [notificationsList]),
          returnValueForMissingStub: null);
  @override
  List<_i15.UserActivity> getNotificationsList() =>
      (super.noSuchMethod(Invocation.method(#getNotificationsList, []),
          returnValue: <_i15.UserActivity>[]) as List<_i15.UserActivity>);
  @override
  void storeNetworkRequest(_i16.NetworkRequest? request) =>
      super.noSuchMethod(Invocation.method(#storeNetworkRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void storeNetworkRequestList(List<_i16.NetworkRequest>? networkRequests) =>
      super.noSuchMethod(
          Invocation.method(#storeNetworkRequestList, [networkRequests]),
          returnValueForMissingStub: null);
  @override
  List<_i16.NetworkRequest> getNetworkRequests() =>
      (super.noSuchMethod(Invocation.method(#getNetworkRequests, []),
          returnValue: <_i16.NetworkRequest>[]) as List<_i16.NetworkRequest>);
  @override
  void storeProfile(_i8.Profile? profile) =>
      super.noSuchMethod(Invocation.method(#storeProfile, [profile]),
          returnValueForMissingStub: null);
  @override
  _i8.Profile getProfile() =>
      (super.noSuchMethod(Invocation.method(#getProfile, []),
          returnValue: _FakeProfile()) as _i8.Profile);
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
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i17.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.Future<_i9.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i9.Response>.value(_FakeResponse()))
          as _i13.Future<_i9.Response>);
  @override
  _i13.Future<_i9.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i9.Response>.value(_FakeResponse()))
          as _i13.Future<_i9.Response>);
  @override
  _i13.Future<_i9.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i18.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i9.Response>.value(_FakeResponse()))
          as _i13.Future<_i9.Response>);
  @override
  _i13.Future<_i9.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i18.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i9.Response>.value(_FakeResponse()))
          as _i13.Future<_i9.Response>);
  @override
  _i13.Future<_i9.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i18.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i9.Response>.value(_FakeResponse()))
          as _i13.Future<_i9.Response>);
  @override
  _i13.Future<_i9.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i18.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i9.Response>.value(_FakeResponse()))
          as _i13.Future<_i9.Response>);
  @override
  _i13.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i13.Future<String>);
  @override
  _i13.Future<_i19.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i19.Uint8List>.value(_i19.Uint8List(0)))
          as _i13.Future<_i19.Uint8List>);
  @override
  _i13.Future<_i10.StreamedResponse> send(_i20.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i10.StreamedResponse>.value(_FakeStreamedResponse()))
          as _i13.Future<_i10.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

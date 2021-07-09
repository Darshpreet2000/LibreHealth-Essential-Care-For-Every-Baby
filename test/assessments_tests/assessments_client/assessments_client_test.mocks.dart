// Mocks generated by Mockito 5.0.10 from annotations
// in newborn_care/test/assessments_tests/assessments_client/assessments_client_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i10;

import 'package:flutter/src/widgets/framework.dart' as _i6;
import 'package:http/src/base_request.dart' as _i11;
import 'package:http/src/client.dart' as _i7;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:newborn_care/models/child_model.dart' as _i4;
import 'package:newborn_care/models/network_request.dart' as _i15;
import 'package:newborn_care/models/profile.dart' as _i5;
import 'package:newborn_care/models/sort_list_enum.dart' as _i13;
import 'package:newborn_care/models/user_activity.dart' as _i14;
import 'package:newborn_care/repository/hive_storage_repository.dart' as _i12;
import 'package:newborn_care/repository/refresh_repository.dart' as _i16;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResponse extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse extends _i1.Fake implements _i3.StreamedResponse {}

class _FakeChildModel extends _i1.Fake implements _i4.ChildModel {}

class _FakeProfile extends _i1.Fake implements _i5.Profile {}

class _FakeBuildContext extends _i1.Fake implements _i6.BuildContext {}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i7.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i9.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i8.Future<_i2.Response>);
  @override
  _i8.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i10.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i10.Uint8List>.value(_i10.Uint8List(0)))
          as _i8.Future<_i10.Uint8List>);
  @override
  _i8.Future<_i3.StreamedResponse> send(_i11.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse()))
          as _i8.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [HiveStorageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveStorageRepository extends _i1.Mock
    implements _i12.HiveStorageRepository {
  MockHiveStorageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.SortListEnum getSortBy() =>
      (super.noSuchMethod(Invocation.method(#getSortBy, []),
          returnValue: _i13.SortListEnum.time) as _i13.SortListEnum);
  @override
  void storeSortBy(_i13.SortListEnum? sortListEnum) =>
      super.noSuchMethod(Invocation.method(#storeSortBy, [sortListEnum]),
          returnValueForMissingStub: null);
  @override
  void storeSingleChild(_i4.ChildModel? child) =>
      super.noSuchMethod(Invocation.method(#storeSingleChild, [child]),
          returnValueForMissingStub: null);
  @override
  _i8.Future<void> storeListOfChild(List<_i4.ChildModel>? childList) =>
      (super.noSuchMethod(Invocation.method(#storeListOfChild, [childList]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i8.Future<void>);
  @override
  void updateChild(String? key, _i4.ChildModel? childModel) =>
      super.noSuchMethod(Invocation.method(#updateChild, [key, childModel]),
          returnValueForMissingStub: null);
  @override
  _i4.ChildModel getSingleChild(String? key) =>
      (super.noSuchMethod(Invocation.method(#getSingleChild, [key]),
          returnValue: _FakeChildModel()) as _i4.ChildModel);
  @override
  List<_i4.ChildModel> getListOfAllChild() =>
      (super.noSuchMethod(Invocation.method(#getListOfAllChild, []),
          returnValue: <_i4.ChildModel>[]) as List<_i4.ChildModel>);
  @override
  void storeNotifications(List<_i14.UserActivity>? notificationsList) => super
      .noSuchMethod(Invocation.method(#storeNotifications, [notificationsList]),
          returnValueForMissingStub: null);
  @override
  List<_i14.UserActivity> getNotificationsList() =>
      (super.noSuchMethod(Invocation.method(#getNotificationsList, []),
          returnValue: <_i14.UserActivity>[]) as List<_i14.UserActivity>);
  @override
  void storeNetworkRequest(_i15.NetworkRequest? request) =>
      super.noSuchMethod(Invocation.method(#storeNetworkRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void storeNetworkRequestList(List<_i15.NetworkRequest>? networkRequests) =>
      super.noSuchMethod(
          Invocation.method(#storeNetworkRequestList, [networkRequests]),
          returnValueForMissingStub: null);
  @override
  List<_i15.NetworkRequest> getNetworkRequests() =>
      (super.noSuchMethod(Invocation.method(#getNetworkRequests, []),
          returnValue: <_i15.NetworkRequest>[]) as List<_i15.NetworkRequest>);
  @override
  void storeProfile(_i5.Profile? profile) =>
      super.noSuchMethod(Invocation.method(#storeProfile, [profile]),
          returnValueForMissingStub: null);
  @override
  _i5.Profile getProfile() =>
      (super.noSuchMethod(Invocation.method(#getProfile, []),
          returnValue: _FakeProfile()) as _i5.Profile);
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

/// A class which mocks [RefreshRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshRepository extends _i1.Mock implements _i16.RefreshRepository {
  MockRefreshRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.BuildContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeBuildContext()) as _i6.BuildContext);
  @override
  set context(_i6.BuildContext? _context) =>
      super.noSuchMethod(Invocation.setter(#context, _context),
          returnValueForMissingStub: null);
  @override
  void startRefreshing() =>
      super.noSuchMethod(Invocation.method(#startRefreshing, []),
          returnValueForMissingStub: null);
  @override
  void addTrackedEntityIDInRequest(_i15.NetworkRequest? request) => super
      .noSuchMethod(Invocation.method(#addTrackedEntityIDInRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void updateChildTrackedEntityID(dynamic res, String? key) => super
      .noSuchMethod(Invocation.method(#updateChildTrackedEntityID, [res, key]),
          returnValueForMissingStub: null);
}
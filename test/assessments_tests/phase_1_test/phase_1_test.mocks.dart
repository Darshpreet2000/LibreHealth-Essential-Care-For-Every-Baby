// Mocks generated by Mockito 5.0.10 from annotations
// in newborn_care/test/assessments_tests/phase_1_test/phase_1_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;

import 'package:flutter/src/widgets/framework.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:newborn_care/models/child_model.dart' as _i3;
import 'package:newborn_care/models/network_request.dart' as _i6;
import 'package:newborn_care/models/on_call_doctor_model.dart' as _i8;
import 'package:newborn_care/models/profile.dart' as _i4;
import 'package:newborn_care/models/sort_list_enum.dart' as _i9;
import 'package:newborn_care/models/user_activity.dart' as _i11;
import 'package:newborn_care/repository/hive_storage_repository.dart' as _i7;
import 'package:newborn_care/repository/notification_repository.dart' as _i12;
import 'package:newborn_care/repository/refresh_repository.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeBuildContext extends _i1.Fake implements _i2.BuildContext {}

class _FakeChildModel extends _i1.Fake implements _i3.ChildModel {}

class _FakeProfile extends _i1.Fake implements _i4.Profile {}

/// A class which mocks [RefreshRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshRepository extends _i1.Mock implements _i5.RefreshRepository {
  MockRefreshRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BuildContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeBuildContext()) as _i2.BuildContext);
  @override
  set context(_i2.BuildContext? _context) =>
      super.noSuchMethod(Invocation.setter(#context, _context),
          returnValueForMissingStub: null);
  @override
  void startRefreshing() =>
      super.noSuchMethod(Invocation.method(#startRefreshing, []),
          returnValueForMissingStub: null);
  @override
  void addEnrollmentIDInRequest(_i6.NetworkRequest? request) => super
      .noSuchMethod(Invocation.method(#addEnrollmentIDInRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void addTrackedEntityIDInRequest(_i6.NetworkRequest? request) => super
      .noSuchMethod(Invocation.method(#addTrackedEntityIDInRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void updateChildTrackedEntityIDAndEnrollmentID(dynamic res, String? key) =>
      super.noSuchMethod(
          Invocation.method(
              #updateChildTrackedEntityIDAndEnrollmentID, [res, key]),
          returnValueForMissingStub: null);
}

/// A class which mocks [HiveStorageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveStorageRepository extends _i1.Mock
    implements _i7.HiveStorageRepository {
  MockHiveStorageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void saveOnCallDoctors(List<_i8.OnCallDoctorModel>? list) =>
      super.noSuchMethod(Invocation.method(#saveOnCallDoctors, [list]),
          returnValueForMissingStub: null);
  @override
  List<_i8.OnCallDoctorModel> getOnCallDoctors() => (super.noSuchMethod(
      Invocation.method(#getOnCallDoctors, []),
      returnValue: <_i8.OnCallDoctorModel>[]) as List<_i8.OnCallDoctorModel>);
  @override
  void saveSummaryOf24Hours(List<int>? summary) =>
      super.noSuchMethod(Invocation.method(#saveSummaryOf24Hours, [summary]),
          returnValueForMissingStub: null);
  @override
  List<int> getSummaryOf24Hours() =>
      (super.noSuchMethod(Invocation.method(#getSummaryOf24Hours, []),
          returnValue: <int>[]) as List<int>);
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
  _i9.SortListEnum getSortBy() =>
      (super.noSuchMethod(Invocation.method(#getSortBy, []),
          returnValue: _i9.SortListEnum.time) as _i9.SortListEnum);
  @override
  void storeSortBy(_i9.SortListEnum? sortListEnum) =>
      super.noSuchMethod(Invocation.method(#storeSortBy, [sortListEnum]),
          returnValueForMissingStub: null);
  @override
  void storeSingleChild(_i3.ChildModel? child) =>
      super.noSuchMethod(Invocation.method(#storeSingleChild, [child]),
          returnValueForMissingStub: null);
  @override
  _i10.Future<void> storeListOfChild(List<_i3.ChildModel>? childList) =>
      (super.noSuchMethod(Invocation.method(#storeListOfChild, [childList]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  void updateChild(String? key, _i3.ChildModel? childModel) =>
      super.noSuchMethod(Invocation.method(#updateChild, [key, childModel]),
          returnValueForMissingStub: null);
  @override
  _i3.ChildModel getSingleChild(String? key) =>
      (super.noSuchMethod(Invocation.method(#getSingleChild, [key]),
          returnValue: _FakeChildModel()) as _i3.ChildModel);
  @override
  List<_i3.ChildModel> getListOfAllChild() =>
      (super.noSuchMethod(Invocation.method(#getListOfAllChild, []),
          returnValue: <_i3.ChildModel>[]) as List<_i3.ChildModel>);
  @override
  void storeNotifications(List<_i11.UserActivity>? notificationsList) => super
      .noSuchMethod(Invocation.method(#storeNotifications, [notificationsList]),
          returnValueForMissingStub: null);
  @override
  List<_i11.UserActivity> getNotificationsList() =>
      (super.noSuchMethod(Invocation.method(#getNotificationsList, []),
          returnValue: <_i11.UserActivity>[]) as List<_i11.UserActivity>);
  @override
  void storeNetworkRequest(_i6.NetworkRequest? request) =>
      super.noSuchMethod(Invocation.method(#storeNetworkRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void storeNetworkRequestList(List<_i6.NetworkRequest>? networkRequests) =>
      super.noSuchMethod(
          Invocation.method(#storeNetworkRequestList, [networkRequests]),
          returnValueForMissingStub: null);
  @override
  List<_i6.NetworkRequest> getNetworkRequests() =>
      (super.noSuchMethod(Invocation.method(#getNetworkRequests, []),
          returnValue: <_i6.NetworkRequest>[]) as List<_i6.NetworkRequest>);
  @override
  void storeProfile(_i4.Profile? profile) =>
      super.noSuchMethod(Invocation.method(#storeProfile, [profile]),
          returnValueForMissingStub: null);
  @override
  _i4.Profile getProfile() =>
      (super.noSuchMethod(Invocation.method(#getProfile, []),
          returnValue: _FakeProfile()) as _i4.Profile);
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

/// A class which mocks [NotificationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotificationRepository extends _i1.Mock
    implements _i12.NotificationRepository {
  MockNotificationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BuildContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeBuildContext()) as _i2.BuildContext);
  @override
  _i10.Future<void> immediateNotification(
          String? key, String? motherName, String? body) =>
      (super.noSuchMethod(
          Invocation.method(#immediateNotification, [key, motherName, body]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> scheduledStageNotification(
          String? key, String? motherName, String? body, DateTime? date) =>
      (super.noSuchMethod(
          Invocation.method(
              #scheduledStageNotification, [key, motherName, body, date]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> scheduledStageNotificationReminder(
          String? key, String? motherName, String? body, DateTime? date) =>
      (super.noSuchMethod(
          Invocation.method(#scheduledStageNotificationReminder,
              [key, motherName, body, date]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> removeScheduledNotification(String? key) => (super
      .noSuchMethod(Invocation.method(#removeScheduledNotification, [key]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i10.Future<void>);
}

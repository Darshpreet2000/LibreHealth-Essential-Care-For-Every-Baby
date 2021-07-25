// Mocks generated by Mockito 5.0.10 from annotations
// in newborn_care/test/notification_screen_test/notification_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;

import 'package:flutter/src/widgets/framework.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:newborn_care/models/child_model.dart' as _i4;
import 'package:newborn_care/models/network_request.dart' as _i12;
import 'package:newborn_care/models/notification_model.dart' as _i7;
import 'package:newborn_care/models/on_call_doctor_model.dart' as _i8;
import 'package:newborn_care/models/profile.dart' as _i5;
import 'package:newborn_care/models/sort_list_enum.dart' as _i9;
import 'package:newborn_care/models/user_activity.dart' as _i11;
import 'package:newborn_care/repository/hive_storage_repository.dart' as _i3;
import 'package:newborn_care/repository/notification_screen_repository.dart'
    as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeBuildContext extends _i1.Fake implements _i2.BuildContext {}

class _FakeHiveStorageRepository extends _i1.Fake
    implements _i3.HiveStorageRepository {}

class _FakeChildModel extends _i1.Fake implements _i4.ChildModel {}

class _FakeProfile extends _i1.Fake implements _i5.Profile {}

/// A class which mocks [NotificationScreenRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotificationScreenRepository extends _i1.Mock
    implements _i6.NotificationScreenRepository {
  MockNotificationScreenRepository() {
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
  _i3.HiveStorageRepository get hiveStorageRepository => (super.noSuchMethod(
      Invocation.getter(#hiveStorageRepository),
      returnValue: _FakeHiveStorageRepository()) as _i3.HiveStorageRepository);
  @override
  set hiveStorageRepository(
          _i3.HiveStorageRepository? _hiveStorageRepository) =>
      super.noSuchMethod(
          Invocation.setter(#hiveStorageRepository, _hiveStorageRepository),
          returnValueForMissingStub: null);
  @override
  List<_i7.NotificationModel> fetchRiskAssessmentsList() => (super.noSuchMethod(
      Invocation.method(#fetchRiskAssessmentsList, []),
      returnValue: <_i7.NotificationModel>[]) as List<_i7.NotificationModel>);
  @override
  List<_i7.NotificationModel> fetchMonitoringAlerts() => (super.noSuchMethod(
      Invocation.method(#fetchMonitoringAlerts, []),
      returnValue: <_i7.NotificationModel>[]) as List<_i7.NotificationModel>);
}

/// A class which mocks [HiveStorageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveStorageRepository extends _i1.Mock
    implements _i3.HiveStorageRepository {
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
  void storeSingleChild(_i4.ChildModel? child) =>
      super.noSuchMethod(Invocation.method(#storeSingleChild, [child]),
          returnValueForMissingStub: null);
  @override
  _i10.Future<void> storeListOfChild(List<_i4.ChildModel>? childList) =>
      (super.noSuchMethod(Invocation.method(#storeListOfChild, [childList]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i10.Future<void>);
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
  void storeNotifications(List<_i11.UserActivity>? notificationsList) => super
      .noSuchMethod(Invocation.method(#storeNotifications, [notificationsList]),
          returnValueForMissingStub: null);
  @override
  List<_i11.UserActivity> getNotificationsList() =>
      (super.noSuchMethod(Invocation.method(#getNotificationsList, []),
          returnValue: <_i11.UserActivity>[]) as List<_i11.UserActivity>);
  @override
  void storeNetworkRequest(_i12.NetworkRequest? request) =>
      super.noSuchMethod(Invocation.method(#storeNetworkRequest, [request]),
          returnValueForMissingStub: null);
  @override
  void storeNetworkRequestList(List<_i12.NetworkRequest>? networkRequests) =>
      super.noSuchMethod(
          Invocation.method(#storeNetworkRequestList, [networkRequests]),
          returnValueForMissingStub: null);
  @override
  List<_i12.NetworkRequest> getNetworkRequests() =>
      (super.noSuchMethod(Invocation.method(#getNetworkRequests, []),
          returnValue: <_i12.NetworkRequest>[]) as List<_i12.NetworkRequest>);
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
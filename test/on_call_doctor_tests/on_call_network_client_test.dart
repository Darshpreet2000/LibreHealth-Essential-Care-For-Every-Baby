import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/network/on_call_doctor_client.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import '../authentication_tests/authentication_functionality_test.mocks.dart';

void main() {
  assessmentClientTest();
}

void assessmentClientTest() {
  MockClient _mockHttpClient = MockClient();
  MockHiveStorageRepository _mockHiveStorageRepository =
      MockHiveStorageRepository();

  //Assessment Client Test
  //Test Cases
  //returns response with 200 code on successful fetching of on call doctors
  //throws fetch data exception on no internet connection
  group('Assessment Client', () {
    OnCallDoctorClient onCallDoctorClient;
    testWidgets(
        'returns response with 200 code on successful fetching of assessments',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      String json = '';
      BuildContext context = tester.element(find.byType(Container));
      onCallDoctorClient = new OnCallDoctorClient(_mockHttpClient, context);
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('username:password'));
      String url = DHIS2Config.serverURL +
          APIConfig().onCallDoctors +
          "&lastUpdatedStartDate=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1)))}";

      when(_mockHttpClient.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenAnswer((_) async => Future.value(http.Response(json, 200)));

      expect(
          await onCallDoctorClient.fetchOnCallDoctors('username', 'password'),
          json);
    });
    testWidgets('throws fetch data exception on no internet connection',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      String json = '';
      BuildContext context = tester.element(find.byType(Container));
      onCallDoctorClient = new OnCallDoctorClient(_mockHttpClient, context);
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('username:password'));
      String url = DHIS2Config.serverURL +
          APIConfig().onCallDoctors +
          "&lastUpdatedStartDate=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1)))}";

      when(_mockHttpClient.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenThrow(SocketException("message"));

      expect(onCallDoctorClient.fetchOnCallDoctors('username', 'password'),
          throwsA(isInstanceOf<FetchDataException>()));
    });
  });
}

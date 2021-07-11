import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/network/assessments_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:synchronized/synchronized.dart';
import 'assessments_client_test.mocks.dart';

@GenerateMocks([http.Client, HiveStorageRepository, RefreshRepository])
void main() {
  assessmentClientTest();
}

void assessmentClientTest() {
  MockClient _mockHttpClient = MockClient();
  MockHiveStorageRepository _mockHiveStorageRepository =
      MockHiveStorageRepository();
  MockRefreshRepository _mockRefreshRepository = MockRefreshRepository();
  AssessmentsClient _assessmentsClient;
  //Assessment Client Test
  //Test Cases
  //returns response with 200 code on successful fetching of assessments
  //throws fetch data exception on no internet connection
  group('Assessment Client', () {
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
      _assessmentsClient = new AssessmentsClient(_mockHttpClient, context,
          Lock(), _mockHiveStorageRepository, _mockRefreshRepository);
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('username:password'));
      String url = DHIS2Config.serverURL +
          APIConfig().getaddEventsAPI(
              DHIS2Config.orgUnit, DHIS2Config.programECEBID, 'key');
      when(_mockHiveStorageRepository.getSingleChild('key')).thenReturn(
          ChildModel(
              'parent', 'ward', 1, 1, 1, DateTime.now(), 'key', 'key', 'None',1,'normal'));
      when(_mockHttpClient.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenAnswer((_) async => Future.value(http.Response(json, 200)));

      expect(
          await _assessmentsClient.getAssessmentsOfChild(
              'key', 'username', 'password'),
          json);
    });
    testWidgets('throws fetch data exception on no internet connection',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      _assessmentsClient = new AssessmentsClient(_mockHttpClient, context,
          Lock(), _mockHiveStorageRepository, _mockRefreshRepository);
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('username:password'));
      String url = DHIS2Config.serverURL +
          APIConfig().getaddEventsAPI(
              DHIS2Config.orgUnit, DHIS2Config.programECEBID, 'key');
      when(_mockHiveStorageRepository.getSingleChild('key')).thenReturn(
          ChildModel(
              'parent', 'ward', 1, 1, 1, DateTime.now(), 'key', 'key', 'None',1,'normal'));
      when(_mockHttpClient.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenThrow(SocketException("message"));

      expect(
          _assessmentsClient.getAssessmentsOfChild(
              'key', 'username', 'password'),
          throwsA(isInstanceOf<FetchDataException>()));
    });
  });
}

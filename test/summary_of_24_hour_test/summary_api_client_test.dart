import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/network/summary_api_client.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

import '../assessments_tests/assessments_client/assessments_client_test.mocks.dart';

void main() {
  assessmentClientTest();
}

void assessmentClientTest() {
  MockClient _mockHttpClient = MockClient();
  SummaryApiClient summaryApiClient;
  //Assessment Client Test
  //Test Cases
  //returns response with 200 code on successful fetching of summary
  //throws fetch data exception on no internet connection
  group('Summary Client', () {
    testWidgets(
        'returns response with 200 code on successful fetching of summary',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      String json = '';
      BuildContext context = tester.element(find.byType(Container));
      summaryApiClient = new SummaryApiClient(_mockHttpClient, context);
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('username:password'));
      
      when(_mockHttpClient.get(
        Uri.parse(DHIS2Config.serverURL +
            APIConfig().enrollments +
            "?ou=${DHIS2Config.orgUnit}&program=${DHIS2Config.programECEBID}&lastUpdatedDuration=1d"),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenAnswer((_) async => Future.value(http.Response(json, 200)));

      expect(
          await summaryApiClient.fetchSummaryOf24Hours(
              'username', 'password'),
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
      summaryApiClient = new SummaryApiClient(_mockHttpClient, context);
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('username:password'));
      
      when(_mockHttpClient.get(
        Uri.parse(DHIS2Config.serverURL +
            APIConfig().enrollments +
            "?ou=${DHIS2Config.orgUnit}&program=${DHIS2Config.programECEBID}&lastUpdatedDuration=1d"),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      )).thenThrow(SocketException("message"));

      expect(
           summaryApiClient.fetchSummaryOf24Hours(
              'username', 'password'),
          throwsA(isInstanceOf<FetchDataException>()));
    });
  });
}

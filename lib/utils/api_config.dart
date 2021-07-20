import 'dhis2_config.dart';

class APIConfig {
  String login = "/api/me";
  String trackedEntityInstance = "/api/trackedEntityInstances";
  String onCallDoctors = "/api/events.json?orgUnit=${DHIS2Config.orgUnit}&program=${DHIS2Config.programOnCallDoctorsID}";
  String userMessages = "/api/messageConversations";
  String enrollments = "/api/enrollments";
  String getaddEventsAPI(
          String orgUnitId, String programID, String trackedEntityInstanceID) =>
      "/api/events.json?orgUnit=$orgUnitId&program=$programID&trackedEntityInstance=$trackedEntityInstanceID";
}

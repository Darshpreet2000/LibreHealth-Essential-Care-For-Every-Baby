import 'dhis2_config.dart';

class APIConfig {
  String login = "/api/me";
  String trackedEntityInstance = "/api/trackedEntityInstances";
  String onCallDoctors =
      "/api/events.json?orgUnit=${DHIS2Config.orgUnit}&program=${DHIS2Config.programOnCallDoctorsID}";
  String userMessages = "/api/messageConversations";
  String enrollments = "/api/enrollments";
  String getImageApi(String eventID) {
    return DHIS2Config.serverURL +
        "/api/events/files?eventUid=$eventID&dataElementUid=${DHIS2Config.onCallDoctorImage}&1111111111111";
  }

  String profileImageAPI(String id) {
    return DHIS2Config.serverURL + "/api/31/fileResources/$id/data";
  }

  String getaddEventsAPI(
          String orgUnitId, String programID, String trackedEntityInstanceID) =>
      "/api/events.json?orgUnit=$orgUnitId&program=$programID&trackedEntityInstance=$trackedEntityInstanceID";
  String getProgramRulesAPI(String id) {
    return DHIS2Config.serverURL + "/api/programRules/$id";
  }
}

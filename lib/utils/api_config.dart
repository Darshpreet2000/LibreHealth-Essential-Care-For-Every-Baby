class APIConfig {
  String login = "/api/me";
  String trackedEntityInstance = "/api/trackedEntityInstances";
  String userMessages = "/api/messageConversations";
  String getaddEventsAPI(
          String orgUnitId, String programID, String trackedEntityInstanceID) =>
      "/api/events.json?orgUnit=$orgUnitId Id&program=$programID&trackedEntityInstance=$trackedEntityInstanceID";
}

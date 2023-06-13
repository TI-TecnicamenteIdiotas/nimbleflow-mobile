const String kMainHubServiceUrl = String.fromEnvironment(
  "MAIN_HUB_BASE_SERVICE_URL",
);

const int kHubRetryConnectionInMilliseconds = 4000;
const int kHubRetryConnectionCount = 4;

const String kTableCreatedEventName = "TableCreated";
const String kTableUpdatedEventName = "TableUpdated";
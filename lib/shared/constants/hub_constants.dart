const String kMainHubServiceUrl = String.fromEnvironment(
  "MAIN_HUB_BASE_SERVICE_URL",
);

const int kHubRetryConnectionInMilliseconds = 4000;
const int kHubRetryConnectionCount = 4;

const String kCategoryCreatedEventName = "CategoryCreated";
const String kCategoryUpdatedEventName = "CategoryUpdated";
const String kCategoryDeletedEventName = "CategoryDeleted";
const String kManyCategoriesDeletedEventName = "ManyCategoriesDeleted";

const String kProductCreatedEventName = "ProductCreated";
const String kProductUpdatedEventName = "ProductUpdated";
const String kProductDeletedEventName = "ProductDeleted";
const String kManyProductsDeletedEventName = "ManyProductsDeleted";

const String kTableCreatedEventName = "TableCreated";
const String kTableUpdatedEventName = "TableUpdated";
const String kTableDeletedEventName = "TableDeleted";
const String kManyTablesDeletedEventName = "ManyTablesDeleted";
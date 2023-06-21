const String kCategoryBaseServiceUrl = String.fromEnvironment(
  "CATEGORY_BASE_SERVICE_URL",
);
final String kCategoryServiceUrl = [
  kCategoryBaseServiceUrl,
  "api/v1/category",
].join("/");

const String kProductBaseServiceUrl = String.fromEnvironment(
  "PRODUCT_BASE_SERVICE_URL",
);
final String kProductServiceUrl = [
  kProductBaseServiceUrl,
  "api/v1/product",
].join("/");

const String kTableBaseServiceUrl = String.fromEnvironment(
  "TABLE_BASE_SERVICE_URL",
);
final String kTableServiceUrl = [
  kTableBaseServiceUrl,
  "api/v1/table",
].join("/");

const String kOrderBaseServiceUrl = String.fromEnvironment(
  "ORDER_BASE_SERVICE_URL",
);

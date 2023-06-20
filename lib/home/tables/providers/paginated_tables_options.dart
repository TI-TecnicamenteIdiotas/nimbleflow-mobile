import 'package:riverpod_annotation/riverpod_annotation.dart';

part "paginated_tables_options.g.dart";

class PaginatedTablesOptions {
  int page;
  int limit;
  bool includeDeleted;

  PaginatedTablesOptions({
    required this.page,
    required this.limit,
    required this.includeDeleted,
  });
}

@riverpod
PaginatedTablesOptions paginatedTablesOptions(PaginatedTablesOptionsRef ref) {
  return PaginatedTablesOptions(
    page: 0,
    limit: 6,
    includeDeleted: false,
  );
}

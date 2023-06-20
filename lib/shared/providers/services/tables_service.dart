import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/shared/models/table/paginated_tables_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/http_constants.dart';
import '../../models/table/update_table_dto.dart';

part "tables_service.g.dart";

final _tableServiceUrl = [
  kTableServiceUrl,
  "api/v1/table",
].join("/");

class TablesService {
  Future<PaginatedTablesModel> httpGetPaginated(
    int page,
    int limit,
    bool includeDeleted,
  ) async {
    var uri = Uri.parse(
      "$_tableServiceUrl?page=$page&limit=$limit&includeDeleted=$includeDeleted",
    );
    var response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      return PaginatedTablesModel(
        totalItems: 0,
        items: List.empty(growable: true),
      );
    }

    return PaginatedTablesModel.fromJson(jsonDecode(response.body));
  }

  Future<void> httpPutTable(UpdateTableDto updateTableDto) async {
    var uri = Uri.parse("$_tableServiceUrl/${updateTableDto.id}");

    await http.put(
      uri,
      body: jsonEncode(updateTableDto),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  Future<void> httpDeleteManyTables(List<String> tablesIds) async {
    var uri = Uri.parse("$_tableServiceUrl/by-ids");

    await http.delete(
      uri,
      body: jsonEncode(tablesIds),
    );
  }

  Future<void> httpDeleteTable(String tableId) async {
    var uri = Uri.parse("$_tableServiceUrl/$tableId");

    await http.delete(uri);
  }
}

@riverpod
TablesService tablesService(TablesServiceRef ref) => TablesService();

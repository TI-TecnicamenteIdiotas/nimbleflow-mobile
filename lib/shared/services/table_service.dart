import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/shared/constants/tables_constants.dart';
import 'package:nimbleflow/shared/models/table/create_table_dto.dart';
import 'package:nimbleflow/shared/models/table/paginated_table_model.dart';

import '../constants/http_constants.dart';
import '../models/table/update_table_dto.dart';

abstract class TableService {
  static final _tableServiceUrl = [
    kTableServiceUrl,
    "api/v1/table",
  ].join("/");

  static Future<void> httpPostTable(CreateTableDto tableDto) async {
    var uri = Uri.parse(_tableServiceUrl);

    await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(tableDto.toJson()),
    );
  }

  static Future<PaginatedTableModel> httpGetPaginated(int page) async {
    var uri = Uri.parse(
      "$_tableServiceUrl?page=$page&limit=$kListOfTablesLimit",
    );

    var response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      return PaginatedTableModel(
        totalItems: 0,
        items: List.empty(growable: true),
      );
    }

    return PaginatedTableModel.fromJson(jsonDecode(response.body));
  }

  static Future httpPutTable(UpdateTableDto tableDto) async {
    var uri = Uri.parse("$_tableServiceUrl/${tableDto.id}");

    await http.put(
      uri,
      body: jsonEncode(tableDto),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  static Future httpDeleteManyTables(List<String> tablesIds) async {
    var uri = Uri.parse("$_tableServiceUrl/by-ids");

    await http.delete(
      uri,
      body: jsonEncode(tablesIds),
    );
  }

  static Future httpDeleteTable(String tableId) async {
    var uri = Uri.parse("$_tableServiceUrl/$tableId");

    await http.delete(uri);
  }
}

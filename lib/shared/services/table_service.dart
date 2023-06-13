import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nimbleflow/shared/models/table/paginated_table_model.dart';

import '../constants/http_constants.dart';
import '../models/table/update_table_dto.dart';

abstract class TableService {
  static final _tableServiceUrl = [
    kTableServiceUrl,
    "api/v1/table",
  ].join("/");

  static Future<PaginatedTableModel> httpGetPaginated(int page,
      int limit,
      bool includeDeleted,) async {
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
      return PaginatedTableModel(
        totalItems: 0,
        items: List.empty(growable: true),
      );
    }

    return PaginatedTableModel.fromJson(jsonDecode(response.body));
  }

  static Future<bool> httpPutTable(UpdateTableDto tableDto) async {
    var uri = Uri.parse("$_tableServiceUrl/${tableDto.id}");

    var response = await http.put(
      uri,
      body: jsonEncode(tableDto),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode != HttpStatus.ok) {
      return false;
    }

    return true;
  }
}

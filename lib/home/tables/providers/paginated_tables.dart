import 'dart:convert';

import 'package:nimbleflow/home/tables/providers/paginated_tables_options.dart';
import 'package:nimbleflow/home/tables/providers/tables_repository.dart';
import 'package:nimbleflow/shared/models/table/paginated_tables_model.dart';
import 'package:nimbleflow/shared/models/table/table_model.dart';
import 'package:nimbleflow/shared/providers/services/tables_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "paginated_tables.g.dart";

@riverpod
class PaginatedTables extends _$PaginatedTables {
  @override
  FutureOr<PaginatedTablesModel> build() async {
    var paginatedTablesOptions = ref.read(paginatedTablesOptionsProvider);
    var tablesService = ref.read(tablesServiceProvider);
    var paginatedTables = await tablesService.httpGetPaginated(
      paginatedTablesOptions.page,
      paginatedTablesOptions.limit,
      paginatedTablesOptions.includeDeleted,
    );

    var tablesRepository = ref.read(tablesRepositoryProvider);
    await tablesRepository.addManyTablesToStorage(paginatedTables.items);

    return paginatedTables;
  }

  Future<void> addTableFromHub(List<dynamic>? hubParams) async {
    var paginatedTablesOptions = ref.read(paginatedTablesOptionsProvider);
    if (state.requireValue.items.length == paginatedTablesOptions.limit) return;

    var json = jsonDecode(hubParams![0]);
    var tableModel = TableModel.fromJson(json);

    await ref.read(tablesRepositoryProvider).addTableToStorage(tableModel);

    state.requireValue
      ..totalItems += 1
      ..items.add(tableModel);
    ref.notifyListeners();
  }

  void updateTableFromHub(TableModel table) {
    var tableToUpdate = state.requireValue.items
        .where((element) => element.id == table.id)
        .firstOrNull;

    if (tableToUpdate == null) return;

    var indexOfTableToUpdate = state.requireValue.items.indexOf(tableToUpdate);

    state.requireValue.items[indexOfTableToUpdate] = tableToUpdate.copyWith(
      accountable: table.accountable,
      isFullyPaid: table.isFullyPaid,
    );
    ref.notifyListeners();
  }

  void deleteManyTablesFromHub(List<String> tablesIds) {
    state.requireValue
      ..totalItems -= tablesIds.length
      ..items.removeWhere((element) => tablesIds.contains(element.id));
    ref.notifyListeners();
  }

  void deleteTableFromHub(String tableId) {
    state.requireValue
      ..totalItems -= 1
      ..items.removeWhere((element) => element.id == tableId);
    ref.notifyListeners();
  }
}

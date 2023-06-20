import 'dart:convert';

import 'package:nimbleflow/shared/providers/hub.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../shared/constants/hub_constants.dart';
import '../../../shared/models/table/table_model.dart';
import 'paginated_tables_options.dart';
import 'tables_repository.dart';

part "tables_hub.g.dart";

class TablesHub {
  HubConnection hub;
  TablesRepository tablesRepository;
  PaginatedTablesOptions paginatedTablesOptions;

  TablesHub({
    required this.hub,
    required this.tablesRepository,
    required this.paginatedTablesOptions,
  });

  void subscribeToTableCreated(
    Future<void> Function(List<dynamic>? hubParams) addTableFromHub,
  ) {
    hub.on(kTableCreatedEventName, addTableFromHub);
  }

  void subscribeToTableUpdated(
    void Function(TableModel table) updateTable,
  ) {
    hub.on(kTableUpdatedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var tableModel = TableModel.fromJson(json);

      await tablesRepository.updateTableInStorage(tableModel);

      updateTable(tableModel);
    });
  }

  void subscribeToManyTablesDeleted(
    void Function(List<String> tablesIds) deleteManyTables,
  ) {
    hub.on(kManyTablesDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var tablesIds = List<String>.from(json["ids"]);

      await tablesRepository.deleteManyTablesFromStorage(tablesIds);

      deleteManyTables(tablesIds);
    });
  }

  void subscribeToTableDeleted(
    void Function(String tableId) deleteTable,
  ) {
    hub.on(kTableDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var tableId = json["id"] as String;

      deleteTable(tableId);
    });
  }

  void dispose() => hub
    ..off(kTableCreatedEventName)
    ..off(kTableUpdatedEventName)
    ..off(kManyTablesDeletedEventName)
    ..off(kTableDeletedEventName);
}

@riverpod
TablesHub tablesHub(TablesHubRef ref) {
  return TablesHub(
    hub: ref.read(hubProvider),
    tablesRepository: ref.read(tablesRepositoryProvider),
    paginatedTablesOptions: ref.read(paginatedTablesOptionsProvider),
  );
}

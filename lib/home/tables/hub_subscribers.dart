import 'dart:convert';

import 'package:nimbleflow/shared/storage/storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/constants/hub_constants.dart';
import '../../shared/models/table/table_model.dart';
import '../../shared/services/hub_service.dart';

Future<void> subscribeToTableCreated(
  int limit,
  List<TableModel> tables,
  void Function(void Function()) setState,
) async {
  HubService.mainHubConnection.on(kTableCreatedEventName, (arguments) async {
    if (tables.length == limit) {
      return;
    }

    var json = jsonDecode(arguments![0]);
    var tableModel = TableModel.fromJson(json);

    await Storage.storage.insert(
      "table",
      tableModel.toStorageMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    setState(() => tables.add(tableModel));
  });
}

Future<void> subscribeToTableUpdated(
  List<TableModel> tables,
  void Function(void Function()) setState,
) async {
  HubService.mainHubConnection.on(kTableUpdatedEventName, (arguments) async {
    var json = jsonDecode(arguments![0]);
    var tableModel = TableModel.fromJson(json);

    var tableToUpdate = tables
        .where(
          (element) => element.id == tableModel.id,
        )
        .firstOrNull;

    if (tableToUpdate == null) return;

    await Storage.storage.update(
      "table",
      tableModel.toStorageMap(),
      where: "id = ?",
      whereArgs: [tableModel.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    setState(() {
      tableToUpdate
        ..accountable = tableModel.accountable
        ..isFullyPaid = tableModel.isFullyPaid;
    });
  });
}

Future<void> subscribeToTableDeleted(
  List<TableModel> tables,
  void Function(void Function()) setState,
) async {
  HubService.mainHubConnection.on(kTableDeletedEventName, (arguments) async {
    var json = jsonDecode(arguments![0]);
    var tableToDeleteId = json["id"] as String;

    tables.removeWhere(
      (element) => element.id == tableToDeleteId,
    );

    await Storage.storage.delete(
      "table",
      where: "id = ?",
      whereArgs: [tableToDeleteId],
    );

    setState(() {});
  });
}

Future<void> subscribeToManyTablesDeleted(
  List<TableModel> tables,
  void Function(void Function()) setState,
) async {
  HubService.mainHubConnection.on(kManyTablesDeletedEventName,
      (arguments) async {
    var json = jsonDecode(arguments![0]) as Map<String, dynamic>;
    var tablesToDeleteIds = List.from(json["ids"]);

    tables.removeWhere(
      (element) => tablesToDeleteIds.contains(element.id),
    );

    await Storage.storage.transaction((txn) async {
      var batch = txn.batch();

      for (var id in tablesToDeleteIds) {
        batch.delete(
          "table",
          where: "id = ?",
          whereArgs: [id],
        );
      }

      await batch.commit(noResult: true);
    });

    setState(() {});
  });
}

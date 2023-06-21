import 'dart:convert';

import 'package:nimbleflow/shared/constants/storage_constants.dart';
import 'package:nimbleflow/home/tables/constants/tables_constants.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:sqflite/sqflite.dart';

import '../../../shared/constants/hub_constants.dart';
import '../models/table_model.dart';

class TableHubSubscribers {
  final List<TableModel> listOfTables;
  final HubConnection hubConnection;
  final Database storage;
  final void Function(void Function()) setState;

  TableHubSubscribers(
    this.listOfTables,
    this.hubConnection,
    this.storage,
    this.setState,
  ) {
    subscribeToTableCreated();
    subscribeToTableUpdated();
    subscribeToTableDeleted();
    subscribeToManyTablesDeleted();
  }

  void subscribeToTableCreated() {
    hubConnection.on(kTableCreatedEventName, (arguments) async {
      if (listOfTables.length == kListOfTablesLimit) return;

      var json = jsonDecode(arguments![0]);
      var tableModel = TableModel.fromJson(json);

      await storage.insert(
        kTableTableName,
        tableModel.toStorageMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      setState(() => listOfTables.add(tableModel));
    });
  }

  void subscribeToTableUpdated() {
    hubConnection.on(kTableUpdatedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var tableModel = TableModel.fromJson(json);

      var tableToUpdate = listOfTables
          .where(
            (element) => element.id == tableModel.id,
          )
          .firstOrNull;

      if (tableToUpdate == null) return;

      await storage.update(
        kTableTableName,
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

  void subscribeToTableDeleted() {
    hubConnection.on(kTableDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var tableToDeleteId = json["id"] as String;

      listOfTables.removeWhere(
        (element) => element.id == tableToDeleteId,
      );

      await storage.delete(
        kTableTableName,
        where: "id = ?",
        whereArgs: [tableToDeleteId],
      );

      setState(() {});
    });
  }

  void subscribeToManyTablesDeleted() {
    hubConnection.on(kManyTablesDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]) as Map<String, dynamic>;
      var tablesToDeleteIds = List.from(json["ids"]);

      listOfTables.removeWhere(
        (element) => tablesToDeleteIds.contains(element.id),
      );

      await storage.transaction((txn) async {
        var batch = txn.batch();

        for (var id in tablesToDeleteIds) {
          batch.delete(
            kTableTableName,
            where: "id = ?",
            whereArgs: [id],
          );
        }

        await batch.commit(noResult: true);
      });

      setState(() {});
    });
  }

  void dispose() {
    hubConnection
      ..off(kTableCreatedEventName)
      ..off(kTableUpdatedEventName)
      ..off(kManyTablesDeletedEventName)
      ..off(kTableDeletedEventName);
  }
}

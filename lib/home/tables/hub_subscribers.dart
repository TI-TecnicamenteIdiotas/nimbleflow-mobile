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

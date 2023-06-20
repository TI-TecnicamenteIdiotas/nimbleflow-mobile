import 'package:nimbleflow/shared/providers/storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../../shared/models/table/table_model.dart';

part "tables_repository.g.dart";

class TablesRepository {
  Database storage;

  TablesRepository({required this.storage});

  Future<void> addManyTablesToStorage(List<TableModel> tables) async {
    await storage.transaction((txn) async {
      var batch = txn.batch();

      for (var table in tables) {
        batch.insert(
          "table",
          TableModel.toStorageMap(table),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
    });
  }

  Future<void> addTableToStorage(TableModel table) async {
    await storage.insert(
      "table",
      TableModel.toStorageMap(table),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTableInStorage(TableModel table) async {
    await storage.update(
      "table",
      TableModel.toStorageMap(table),
      where: "id = ?",
      whereArgs: [table.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteManyTablesFromStorage(List<String> tablesIds) async {
    await storage.transaction((txn) async {
      var batch = txn.batch();

      for (var id in tablesIds) {
        batch.delete(
          "table",
          where: "id = ?",
          whereArgs: [id],
        );
      }

      await batch.commit(noResult: true);
    });
  }

  Future<void> deleteTableFromStorage(String tableId) async {
    await storage.delete(
      "table",
      where: "id = ?",
      whereArgs: [tableId],
    );
  }
}

@riverpod
TablesRepository tablesRepository(TablesRepositoryRef ref) => TablesRepository(
      storage: ref.read(storageProvider),
    );

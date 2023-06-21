import 'package:nimbleflow/shared/constants/storage_constants.dart';
import 'package:nimbleflow/home/tables/services/table_service.dart';
import 'package:sqflite/sqflite.dart';

import '../models/table_model.dart';
import '../../../shared/storage/storage.dart';

Future<void> initTables(
  List<TableModel> listOfTables,
  int page,
  void Function(bool value) setIsLoading,
) async {
  setIsLoading(true);

  var response = await TableService.httpGetPaginated(page);

  await Storage.storage.transaction((txn) async {
    var batch = txn.batch();

    for (var item in response.items) {
      batch.insert(
        kTableTableName,
        item.toStorageMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  });

  listOfTables.addAll(response.items);
  setIsLoading(false);
}

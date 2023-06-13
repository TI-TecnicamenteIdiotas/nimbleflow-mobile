import 'package:nimbleflow/shared/services/table_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/models/table/table_model.dart';
import '../../shared/storage/storage.dart';

Future<void> initTables(
  List<TableModel> tables,
  int page,
  int limit,
  bool includeDeleted,
  void Function(bool value) setIsLoading,
) async {
  setIsLoading(true);

  var response = await TableService.httpGetPaginated(
    page,
    limit,
    includeDeleted,
  );

  await Storage.storage.transaction((txn) async {
    var batch = txn.batch();

    for (var item in response.items) {
      batch.insert(
        "table",
        item.toStorageMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  });

  tables.addAll(response.items);
  setIsLoading(false);
}

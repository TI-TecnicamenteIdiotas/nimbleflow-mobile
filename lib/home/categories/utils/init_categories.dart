import 'package:nimbleflow/shared/constants/storage_constants.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/categories/services/category_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../../shared/storage/storage.dart';

Future<void> initCategories(
    List<CategoryModel> listOfCategories,
    int page,
    void Function(bool value) setIsLoading,
    ) async {
  setIsLoading(true);

  var response = await CategoryService.httpGetPaginated(page);

  await Storage.storage.transaction((txn) async {
    var batch = txn.batch();

    for (var item in response.items) {
      batch.insert(
        kCategoryTableName,
        item.toStorageMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  });

  listOfCategories.addAll(response.items);
  setIsLoading(false);
}

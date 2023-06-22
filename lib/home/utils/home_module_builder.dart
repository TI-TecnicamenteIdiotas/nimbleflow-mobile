import 'package:nimbleflow/home/categories/services/category_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/constants/storage_constants.dart';
import '../categories/models/category_model.dart';
import '../products/models/product_model.dart';
import '../products/services/product_service.dart';
import '../tables/models/table_model.dart';
import '../tables/services/table_service.dart';

class HomeModuleBuilder {
  final Database storage;
  final void Function(bool value) setIsLoading;

  final int page = 0;

  final List<CategoryModel> listOfCategories;
  final List<ProductModel> listOfProducts;
  final List<TableModel> listOfTables;

  HomeModuleBuilder(
    this.storage,
    this.listOfCategories,
    this.listOfProducts,
    this.listOfTables,
    this.setIsLoading,
  );

  Future<void> _initCategories() async {
    var response = await CategoryService.httpGetPaginated(page);

    await storage.transaction((txn) async {
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
  }

  Future<void> _initProducts() async {
    var response = await ProductService.httpGetPaginated(page);

    await storage.transaction((txn) async {
      var batch = txn.batch();

      for (var item in response.items) {
        batch.insert(
          kProductTableName,
          item.toStorageMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
    });

    listOfProducts.addAll(response.items);
  }

  Future<void> _initTables() async {
    var response = await TableService.httpGetPaginated(page);

    await storage.transaction((txn) async {
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
  }

  Future<void> start() async {
    setIsLoading(true);
    await _initCategories();
    await _initProducts();
    await _initTables();
    setIsLoading(false);
  }
}

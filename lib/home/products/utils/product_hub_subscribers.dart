import 'dart:convert';

import 'package:signalr_core/signalr_core.dart';
import 'package:sqflite/sqflite.dart';

import '../../../shared/constants/hub_constants.dart';
import '../../../shared/constants/storage_constants.dart';
import '../../../shared/storage/query_builders.dart';
import '../../categories/models/category_model.dart';
import '../constants/products_constants.dart';
import '../models/product_model.dart';
import '../models/product_model_with_relations.dart';

class ProductHubSubscriber {
  final List<ProductModelWithRelations> listOfProductsWithRelations;
  final HubConnection hubConnection;
  final Database storage;
  final void Function(void Function()) setState;

  ProductHubSubscriber(
    this.listOfProductsWithRelations,
    this.hubConnection,
    this.storage,
    this.setState,
  ) {
    subscribeToProductCreated();
    subscribeToProductUpdated();
    subscribeToProductDeleted();
    subscribeToManyProductsDeleted();
    subscribeToProductCategoryUpdated();
    subscribeToManyProductsCategoriesDeleted();
    subscribeToProductCategoryDeleted();
  }

  void subscribeToProductCreated() {
    hubConnection.on(kProductCreatedEventName, (arguments) async {
      if (listOfProductsWithRelations.length == kListOfProductsLimit) return;

      var json = jsonDecode(arguments![0]);
      var productModel = ProductModel.fromJson(json);

      await storage.insert(
        kProductTableName,
        productModel.toStorageMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      var queryResponse = (await storage.rawQuery(
        buildProductWithRelationsQuery(productModel.id),
      ))
          .first;
      var productWithRelations =
          ProductModelWithRelations.fromStorageMap(queryResponse);

      setState(() => listOfProductsWithRelations.add(productWithRelations));
    });
  }

  void subscribeToProductUpdated() {
    hubConnection.on(kProductUpdatedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var productModel = ProductModel.fromJson(json);

      var productToUpdate = listOfProductsWithRelations
          .where(
            (element) => element.id == productModel.id,
          )
          .firstOrNull;

      if (productToUpdate == null) return;

      await storage.update(
        kProductTableName,
        productModel.toStorageMap(),
        where: "id = ?",
        whereArgs: [productModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      var queryResponse = (await storage.rawQuery(
        buildProductWithRelationsQuery(productModel.id),
      ))
          .first;
      var productWithRelations =
          ProductModelWithRelations.fromStorageMap(queryResponse);

      setState(() {
        productToUpdate
          ..title = productModel.title
          ..description = productModel.description
          ..price = productModel.price
          ..imageUrl = productModel.imageUrl
          ..isFavorite = productModel.isFavorite
          ..category = productWithRelations.category;
      });
    });
  }

  void subscribeToProductDeleted() {
    hubConnection.on(kProductDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var productToDeleteId = json["id"] as String;

      listOfProductsWithRelations.removeWhere(
        (element) => element.id == productToDeleteId,
      );

      await storage.delete(
        kProductTableName,
        where: "id = ?",
        whereArgs: [productToDeleteId],
      );

      setState(() {});
    });
  }

  void subscribeToManyProductsDeleted() {
    hubConnection.on(kManyProductsDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]) as Map<String, dynamic>;
      var productsToDeleteIds = List<String>.from(json["ids"]);

      listOfProductsWithRelations.removeWhere(
        (element) => productsToDeleteIds.contains(element.id),
      );

      await storage.transaction((txn) async {
        var batch = txn.batch();

        for (var id in productsToDeleteIds) {
          batch.delete(
            kProductTableName,
            where: "id = ?",
            whereArgs: [id],
          );
        }

        await batch.commit(noResult: true);
      });

      setState(() {});
    });
  }

  void subscribeToProductCategoryUpdated() {
    hubConnection.on(kProductCategoryUpdated, (arguments) {
      var json = jsonDecode(arguments![0]);
      var categoryModel = CategoryModel.fromJson(json);

      var listOfProductsToUpdate = listOfProductsWithRelations.where(
        (element) => element.category.id == categoryModel.id,
      );

      if (listOfProductsToUpdate.isEmpty) return;

      for (var product in listOfProductsToUpdate) {
        product.category
          ..title = categoryModel.title
          ..colorTheme = categoryModel.colorTheme
          ..categoryIcon = categoryModel.categoryIcon;
      }

      setState(() {});
    });
  }

  void subscribeToManyProductsCategoriesDeleted() {
    hubConnection.on(kManyProductsCategoriesDeleted, (arguments) {
      var json = jsonDecode(arguments![0]) as Map<String, dynamic>;
      var deletedCategoriesIds = List<String>.from(json["ids"]);

      listOfProductsWithRelations.removeWhere((element) {
        return deletedCategoriesIds.contains(element.category.id);
      });

      setState(() {});
    });
  }

  void subscribeToProductCategoryDeleted() {
    hubConnection.on(kProductCategoryDeleted, (arguments) {
      var json = jsonDecode(arguments![0]);
      var deletedCategoryId = json["id"] as String;

      listOfProductsWithRelations.removeWhere((element) {
        return element.category.id == deletedCategoryId;
      });

      setState(() {});
    });
  }

  void dispose() {
    hubConnection
      ..off(kProductCreatedEventName)
      ..off(kProductUpdatedEventName)
      ..off(kManyProductsDeletedEventName)
      ..off(kProductDeletedEventName)
      ..off(kCategoryUpdatedEventName)
      ..off(kManyCategoriesDeletedEventName)
      ..off(kCategoryDeletedEventName);
  }
}

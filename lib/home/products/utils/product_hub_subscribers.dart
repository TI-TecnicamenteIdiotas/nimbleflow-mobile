import 'dart:convert';

import 'package:signalr_core/signalr_core.dart';
import 'package:sqflite/sqflite.dart';

import '../../../shared/constants/hub_constants.dart';
import '../../../shared/constants/storage_constants.dart';
import '../../../shared/storage/query_builders.dart';
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
      var tableToDeleteId = json["id"] as String;

      listOfProductsWithRelations.removeWhere(
        (element) => element.id == tableToDeleteId,
      );

      await storage.delete(
        kProductTableName,
        where: "id = ?",
        whereArgs: [tableToDeleteId],
      );

      setState(() {});
    });
  }

  void subscribeToManyProductsDeleted() {
    hubConnection.on(kManyProductsDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]) as Map<String, dynamic>;
      var productsToDeleteIds = List.from(json["ids"]);

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

  void dispose() {
    hubConnection
      ..off(kProductCreatedEventName)
      ..off(kProductUpdatedEventName)
      ..off(kManyProductsDeletedEventName)
      ..off(kProductDeletedEventName);
  }
}

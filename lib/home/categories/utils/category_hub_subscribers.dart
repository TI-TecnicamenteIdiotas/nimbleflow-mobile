import 'dart:convert';

import 'package:signalr_core/signalr_core.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/categories_constants.dart';
import '../../../shared/constants/hub_constants.dart';
import '../../../shared/constants/storage_constants.dart';
import '../models/category_model.dart';

class CategoryHubSubscriber {
  final List<CategoryModel> listOfCategories;
  final HubConnection hubConnection;
  final Database storage;
  final void Function(void Function()) setState;

  CategoryHubSubscriber(
    this.listOfCategories,
    this.hubConnection,
    this.storage,
    this.setState,
  ) {
    subscribeToCategoryCreated();
    subscribeToCategoryUpdated();
    subscribeToManyCategoriesDeleted();
    subscribeToCategoryDeleted();
  }

  void subscribeToCategoryCreated() {
    hubConnection.on(kCategoryCreatedEventName, (arguments) async {
      if (listOfCategories.length == kListOfCategoriesLimit) return;

      var json = jsonDecode(arguments![0]);
      var categoryModel = CategoryModel.fromJson(json);

      await storage.insert(
        kCategoryTableName,
        categoryModel.toStorageMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      setState(() => listOfCategories.add(categoryModel));
    });
  }

  void subscribeToCategoryUpdated() {
    hubConnection.on(kCategoryUpdatedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var categoryModel = CategoryModel.fromJson(json);

      var categoryToUpdate = listOfCategories
          .where(
            (element) => element.id == categoryModel.id,
          )
          .firstOrNull;

      if (categoryToUpdate == null) return;

      await storage.update(
        kCategoryTableName,
        categoryModel.toStorageMap(),
        where: "id = ?",
        whereArgs: [categoryModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      setState(() {
        categoryToUpdate
          ..title = categoryModel.title
          ..colorTheme = categoryModel.colorTheme
          ..categoryIcon = categoryModel.categoryIcon;
      });
    });
  }

  void subscribeToManyCategoriesDeleted() {
    hubConnection.on(kManyCategoriesDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]) as Map<String, dynamic>;
      var categoriesToDeleteIds = List.from(json["ids"]);

      listOfCategories.removeWhere(
        (element) => categoriesToDeleteIds.contains(element.id),
      );

      await storage.transaction((txn) async {
        var batch = txn.batch();

        for (var id in categoriesToDeleteIds) {
          batch.delete(
            kCategoryTableName,
            where: "id = ?",
            whereArgs: [id],
          );
        }

        await batch.commit(noResult: true);
      });

      setState(() {});
    });
  }

  void subscribeToCategoryDeleted() {
    hubConnection.on(kCategoryDeletedEventName, (arguments) async {
      var json = jsonDecode(arguments![0]);
      var categoryToDeleteId = json["id"] as String;

      listOfCategories.removeWhere(
            (element) => element.id == categoryToDeleteId,
      );

      await storage.delete(
        kCategoryTableName,
        where: "id = ?",
        whereArgs: [categoryToDeleteId],
      );

      setState(() {});
    });
  }

  void dispose() {
    hubConnection
      ..off(kCategoryCreatedEventName)
      ..off(kCategoryUpdatedEventName)
      ..off(kManyCategoriesDeletedEventName)
      ..off(kCategoryDeletedEventName);
  }
}

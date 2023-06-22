import 'package:nimbleflow/shared/constants/storage_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Storage {
  static late Database storage;

  Future<void> openStorage() async {
    storage = await openDatabase(
      join(
        await getDatabasesPath(),
        'nimbleflow_database.db',
      ),
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, _) async {
        await db.execute(
          """CREATE TABLE IF NOT EXISTS
          $kCategoryTableName(
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            colorTheme INTEGER NULL,
            categoryIcon INTEGER NULL
          )""",
        );

        await db.execute(
          """CREATE TABLE IF NOT EXISTS
          $kProductTableName(
            id TEXT PRIMARY KEY,
            categoryId TEXT,
            title TEXT NOT NULL,
            description TEXT NULL,
            price REAL NOT NULL,
            imageUrl TEXT NULL,
            isFavorite INTEGER NOT NULL,
            FOREIGN KEY (categoryId) REFERENCES $kCategoryTableName (id) ON DELETE CASCADE
          )""",
        );

        await db.execute(
          """CREATE TABLE IF NOT EXISTS
          "$kTableTableName"(
            id TEXT PRIMARY KEY,
            accountable TEXT NOT NULL,
            isFullyPaid INTEGER
          )""",
        );

        await db.execute(
          """CREATE TABLE IF NOT EXISTS
          "$kOrderTableName"(
            id TEXT PRIMARY KEY,
            tableId TEXT,
            orderDate TEXT,
            paymentMethod TEXT,
            active INTEGER,
            FOREIGN KEY (tableId) REFERENCES "$kTableTableName" (id) ON DELETE CASCADE
          )""",
        );

        await db.execute(
          """CREATE TABLE IF NOT EXISTS
          $kOrderProductTableName(
            orderId TEXT,
            productId TEXT,
            FOREIGN KEY (orderId) REFERENCES "$kOrderTableName" (id) ON DELETE CASCADE,
            FOREIGN KEY (productId) REFERENCES $kProductTableName (id) ON DELETE CASCADE
          )""",
        );
      },
      version: 1,
      onOpen: (db) async {
        await db.delete("category");
        await db.delete("product");
        await db.delete("order_product");
        await db.delete("order");
        await db.delete("table");
      },
    );
  }
}

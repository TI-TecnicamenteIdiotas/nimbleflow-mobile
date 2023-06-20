import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'storage.g.dart';

Future<Database> storageProviderBuilder() async {
  return openDatabase(
    join(
      await getDatabasesPath(),
      'nimbleflow_database.db',
    ),
    onCreate: (db, _) async {
      await db.execute('PRAGMA foreign_keys = ON');

      await db.execute(
        """CREATE TABLE IF NOT EXISTS
          category(
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            colorTheme INTEGER NULL,
            categoryIcon INTEGER NULL
          )""",
      );

      await db.execute(
        """CREATE TABLE IF NOT EXISTS
          product(
            id TEXT PRIMARY KEY,
            categoryId TEXT,
            title TEXT NOT NULL,
            description TEXT NULL,
            price REAL NOT NULL,
            imageUrl TEXT NULL,
            isFavorite INTEGER NOT NULL,
            FOREIGN KEY (categoryId) REFERENCES category (id)
          )""",
      );

      await db.execute(
        """CREATE TABLE IF NOT EXISTS
          "table"(
            id TEXT PRIMARY KEY,
            accountable TEXT NOT NULL,
            isFullyPaid INTEGER
          )""",
      );

      await db.execute(
        """CREATE TABLE IF NOT EXISTS
          "order"(
            id TEXT PRIMARY KEY,
            tableId TEXT,
            orderDate TEXT,
            paymentMethod TEXT,
            active INTEGER,
            FOREIGN KEY (tableId) REFERENCES "table" (id)
          )""",
      );

      await db.execute(
        """CREATE TABLE IF NOT EXISTS
          order_product(
            orderId TEXT,
            productId TEXT,
            FOREIGN KEY (orderId) REFERENCES "order" (id),
            FOREIGN KEY (productId) REFERENCES product (id)
          )""",
      );
    },
    version: 1,
  );
}

@riverpod
Database storage(StorageRef ref) {
  throw UnimplementedError("Must await instance first");
}
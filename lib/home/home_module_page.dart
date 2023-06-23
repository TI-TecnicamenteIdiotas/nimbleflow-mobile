import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/products/models/product_model_with_relations.dart';
import 'package:nimbleflow/home/utils/home_module_builder.dart';
import 'package:nimbleflow/home/utils/hub_handlers.dart';
import 'package:nimbleflow/home/orders/orders_page.dart';
import 'package:nimbleflow/home/categories/categories_module_page.dart';
import 'package:nimbleflow/home/tables/tables_module_page.dart';
import 'package:nimbleflow/shared/storage/storage.dart';

import 'products/products_module_page.dart';
import 'tables/models/table_model.dart';

class HomeModulePage extends StatefulWidget {
  const HomeModulePage({super.key});

  @override
  State<HomeModulePage> createState() => _HomeModulePageState();
}

class _HomeModulePageState extends State<HomeModulePage> {
  var navigationBarCurrentIndex = 0;

  final listOfCategories = List<CategoryModel>.empty(growable: true);
  final listOfProducts = List<ProductModelWithRelations>.empty(growable: true);
  final listOfTables = List<TableModel>.empty(growable: true);

  bool isLoading = false;

  void setIsLoading(bool value) => setState(() => isLoading = value);

  void changeSelectedModule(int index) {
    setState(() => navigationBarCurrentIndex = index);
  }

  @override
  void initState() {
    super.initState();
    handleHubConnectionClosed(context);
    handleHubReconnection(context);
    handleHubReconnected(context);
    HomeModuleBuilder(
      Storage.storage,
      listOfCategories,
      listOfProducts,
      listOfTables,
      setIsLoading,
    ).start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationBarCurrentIndex,
        children: [
          TablesModulePage(listOfTables, isLoading),
          const OrdersPage(),
          ProductsModulePage(listOfProducts, listOfCategories, isLoading),
          CategoriesModulePage(listOfCategories, isLoading),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationBarCurrentIndex,
        onTap: changeSelectedModule,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar_rounded),
            label: "Mesas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: "Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: "Produtos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "Categorias",
          ),
        ],
      ),
    );
  }
}

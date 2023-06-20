import 'package:flutter/material.dart';
import 'package:nimbleflow/home/hub_handlers.dart';
import 'package:nimbleflow/home/orders/orders_page.dart';
import 'package:nimbleflow/home/categories/categories_page.dart';
import 'package:nimbleflow/home/products/products_page.dart';
import 'package:nimbleflow/home/tables/tables_module_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navigationBarCurrentIndex = 0;

  void changeSelectedModule(int index) {
    setState(() => navigationBarCurrentIndex = index);
  }

  @override
  void initState() {
    super.initState();
    handleHubConnectionClosed(context);
    handleHubReconnection(context);
    handleHubReconnected(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationBarCurrentIndex,
        children: const [
          TablesModulePage(),
          OrdersPage(),
          ProductsPage(),
          CategoriesPage(),
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

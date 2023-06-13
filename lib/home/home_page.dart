import 'package:flutter/material.dart';
import 'package:nimbleflow/home/hub_handlers.dart';
import 'package:nimbleflow/home/orders/orders_page.dart';
import 'package:nimbleflow/home/products/products_page.dart';
import 'package:nimbleflow/home/tables/tables_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bottomNavigationBarSelectedIndex = 0;

  void _onBottomNavigationBarSelected(int index) {
    setState(() => _bottomNavigationBarSelectedIndex = index);
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
        index: _bottomNavigationBarSelectedIndex,
        children: const [
          TablesPage(),
          OrdersPage(),
          ProductsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavigationBarSelectedIndex,
        onTap: _onBottomNavigationBarSelected,
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
        ],
      ),
    );
  }
}

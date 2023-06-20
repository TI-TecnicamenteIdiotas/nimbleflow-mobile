import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimbleflow/home/orders/orders_page.dart';
import 'package:nimbleflow/home/categories/categories_page.dart';
import 'package:nimbleflow/home/products/products_page.dart';
import 'package:nimbleflow/home/providers/hub_handlers.dart';
import 'package:nimbleflow/home/tables/providers/navigation_bar.dart';
import 'package:nimbleflow/home/tables/providers/paginated_tables.dart';
import 'package:nimbleflow/home/tables/providers/tables_hub.dart';
import 'package:nimbleflow/home/tables/tables_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(hubHandlersProvider)
      ..handleHubConnectionClosed(context)
      ..handleHubReconnection(context)
      ..handleHubReconnected(context);

    var paginatedTables = ref.read(paginatedTablesProvider.notifier);
    ref.read(tablesHubProvider)
      ..subscribeToTableCreated(paginatedTables.addTableFromHub)
      ..subscribeToTableUpdated(paginatedTables.updateTableFromHub)
      ..subscribeToManyTablesDeleted(paginatedTables.deleteManyTablesFromHub)
      ..subscribeToTableDeleted(paginatedTables.deleteTableFromHub);
  }

  @override
  void dispose() {
    super.dispose();
    ref.read(tablesHubProvider).dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigationBarIndex = ref.watch(navigationBarProvider);

    return Scaffold(
      body: IndexedStack(
        index: navigationBarIndex,
        children: const [
          TablesPage(),
          OrdersPage(),
          ProductsPage(),
          CategoriesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationBarIndex,
        onTap: ref.read(navigationBarProvider.notifier).setNavigationBar,
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

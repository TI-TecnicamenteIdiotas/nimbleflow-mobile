import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimbleflow/home/tables/table/create_table_page.dart';
import 'package:nimbleflow/home/tables/table/table_page.dart';
import 'package:nimbleflow/shared/models/table/paginated_tables_model.dart';

import '../../shared/models/table/table_model.dart';
import '../../shared/widgets/floating_action_button_widget.dart';
import '../../shared/widgets/loading_dialog_widget.dart';
import 'providers/paginated_tables.dart';

class TablesPage extends ConsumerStatefulWidget {
  const TablesPage({super.key});

  @override
  ConsumerState<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends ConsumerState<TablesPage> {
  final GlobalKey<NavigatorState> _subPageNavigatorKey = GlobalKey();

  void _navigateToCreateTablePage() async {
    await Navigator.push(
      _subPageNavigatorKey.currentContext ?? context,
      MaterialPageRoute(
        builder: (_) => const CreateTablePage(),
      ),
    );
  }

  void _handleOnTapListItem(TableModel table) async {
    await Navigator.push(
      _subPageNavigatorKey.currentContext ?? context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return TablePage(table: table);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 1, end: 0);
          animation.drive(tween);

          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget buildListItem(TableModel table) {
    return Card(
      key: ValueKey<String>(table.id),
      elevation: 2,
      child: ListTile(
        title: Text(table.accountable),
        onTap: () => _handleOnTapListItem(table),
      ),
    );
  }

  Widget buildList(PaginatedTablesModel paginatedTablesModel) {
    return ListView.builder(
      itemCount: paginatedTablesModel.items.length,
      itemBuilder: (_, index) => buildListItem(
        paginatedTablesModel.items[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(paginatedTablesProvider).when(
          data: (data) => Scaffold(
            appBar: AppBar(title: const Text("Mesas")),
            body: Center(
              child: MaterialApp(
                theme: Theme.of(context),
                debugShowCheckedModeBanner: false,
                navigatorKey: _subPageNavigatorKey,
                home: buildList(data),
              ),
            ),
            floatingActionButton: FloatingActionButtonWidget(
              heroTag: "create",
              icon: const Icon(Icons.add),
              iconText: "Nova mesa",
              onPressed: _navigateToCreateTablePage,
            ),
          ),
          error: (_, stackTrace) => ErrorWidget(stackTrace),
          loading: () => const LoadingDialogWidget(),
        );
  }
}

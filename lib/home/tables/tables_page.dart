import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/init_tables.dart';
import 'package:nimbleflow/home/tables/table/create_table_page.dart';
import 'package:nimbleflow/home/tables/table/table_page.dart';
import 'package:nimbleflow/shared/constants/hub_constants.dart';
import 'package:nimbleflow/shared/widgets/floating_action_button_widget.dart';
import 'package:nimbleflow/shared/widgets/loading_dialog_widget.dart';

import '../../shared/models/table/table_model.dart';
import '../../shared/services/hub_service.dart';
import 'hub_subscribers.dart';

class TablesPage extends StatefulWidget {
  const TablesPage({super.key});

  @override
  State<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  final GlobalKey<NavigatorState> _subPageNavigatorKey = GlobalKey();
  final int _page = 0;
  final int _limit = 8;
  final bool _includeDeleted = false;
  bool _isLoading = false;
  bool _canShowAddTableButton = true;
  final _tables = List<TableModel>.empty(growable: true);

  void _setIsLoading(bool value) => setState(() => _isLoading = value);

  void _setCanShowAddTableButton(bool value) {
    setState(() => _canShowAddTableButton = value);
  }

  void _handleFloatingActionButtonTap() async {
    _setCanShowAddTableButton(false);
    await Navigator.push(
      _subPageNavigatorKey.currentContext ?? context,
      MaterialPageRoute(
        builder: (_) => const CreateTablePage(),
      ),
    );
    _setCanShowAddTableButton(true);
  }

  void _handleOnTapListItem(TableModel table) async {
    _setCanShowAddTableButton(false);
    await Navigator.push(
      _subPageNavigatorKey.currentContext ?? context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return TablePage(
            table: table,
            setParentState: setState,
          );
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
    _setCanShowAddTableButton(true);
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

  Widget buildList() {
    return ListView.builder(
      itemCount: _tables.length,
      itemBuilder: (_, index) => buildListItem(_tables[index]),
    );
  }

  @override
  void initState() {
    super.initState();
    subscribeToTableCreated(_limit, _tables, setState);
    subscribeToTableUpdated(_tables, setState);
    subscribeToManyTablesDeleted(_tables, setState);
    subscribeToTableDeleted(_tables, setState);
    initTables(_tables, _page, _limit, _includeDeleted, _setIsLoading);
  }

  @override
  void dispose() {
    super.dispose();
    HubService.mainHubConnection
      ..off(kTableCreatedEventName)
      ..off(kTableUpdatedEventName)
      ..off(kManyTablesDeletedEventName)
      ..off(kTableDeletedEventName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mesas")),
      body: Center(
        child: MaterialApp(
          theme: Theme.of(context),
          debugShowCheckedModeBanner: false,
          navigatorKey: _subPageNavigatorKey,
          home: Builder(
            builder: (_) =>
                _isLoading ? const LoadingDialogWidget() : buildList(),
          ),
        ),
      ),
      floatingActionButton: _canShowAddTableButton
          ? FloatingActionButtonWidget(
              heroTag: "create",
              isLoading: _isLoading,
              onPressed: _handleFloatingActionButtonTap,
              icon: const Icon(Icons.add),
              iconText: "Nova mesa",
            )
          : null,
    );
  }
}

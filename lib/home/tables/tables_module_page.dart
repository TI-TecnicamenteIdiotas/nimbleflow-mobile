import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/utils/init_tables.dart';
import 'package:nimbleflow/home/tables/widgets/list_of_tables_widget.dart';
import 'package:nimbleflow/shared/storage/storage.dart';
import 'package:nimbleflow/shared/widgets/loading_dialog_widget.dart';

import '../../shared/constants/global_keys_constants.dart';
import '../../shared/services/hub_service.dart';
import 'models/table_model.dart';
import 'utils/hub_subscribers.dart';

class TablesModulePage extends StatefulWidget {
  const TablesModulePage({super.key});

  @override
  State<TablesModulePage> createState() => _TablesModulePageState();
}

class _TablesModulePageState extends State<TablesModulePage> {
  late final TableHubSubscribers tableHubSubscribers;

  bool isLoading = false;
  final listOfTables = List<TableModel>.empty(growable: true);

  void setIsLoading(bool value) => setState(() => isLoading = value);

  @override
  void initState() {
    super.initState();
    var page = 0;

    tableHubSubscribers = TableHubSubscribers(
      listOfTables,
      HubService.mainHubConnection,
      Storage.storage,
      setState,
    );
    initTables(listOfTables, page, setIsLoading);
  }

  @override
  void dispose() {
    super.dispose();
    tableHubSubscribers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mesas")),
      body: MaterialApp(
        theme: Theme.of(context),
        debugShowCheckedModeBanner: false,
        navigatorKey: kTablesModuleNavigatorKey,
        home: Builder(
          builder: (_) {
            if (isLoading) return const Center(child: LoadingDialogWidget());
            return ListOfTablesWidget(listOfTables);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/widgets/list_of_tables_widget.dart';
import 'package:nimbleflow/shared/storage/storage.dart';
import 'package:nimbleflow/shared/widgets/loading_dialog_widget.dart';

import '../../shared/constants/global_keys_constants.dart';
import '../../shared/services/hub_service.dart';
import 'models/table_model.dart';
import 'utils/table_hub_subscribers.dart';

class TablesModulePage extends StatefulWidget {
  final List<TableModel> listOfTables;
  final bool isLoading;

  const TablesModulePage(this.listOfTables, this.isLoading, {super.key});

  @override
  State<TablesModulePage> createState() => _TablesModulePageState();
}

class _TablesModulePageState extends State<TablesModulePage> {
  late final TableHubSubscribers tableHubSubscribers;

  @override
  void initState() {
    super.initState();

    tableHubSubscribers = TableHubSubscribers(
      widget.listOfTables,
      HubService.mainHubConnection,
      Storage.storage,
      setState,
    );
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
            if (widget.isLoading) {
              return const Center(child: LoadingDialogWidget());
            }
            return ListOfTablesWidget(widget.listOfTables);
          },
        ),
      ),
    );
  }
}

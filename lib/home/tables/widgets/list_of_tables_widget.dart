import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/pages/create_table_page.dart';
import 'package:nimbleflow/home/tables/widgets/list_of_tables_list_item_widget.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';

import '../../../shared/widgets/new_button_widget.dart';
import '../models/table_model.dart';

class ListOfTablesWidget extends StatelessWidget {
  final List<TableModel> listOfTables;

  const ListOfTablesWidget(this.listOfTables, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listOfTables.length,
          itemBuilder: (_, index) {
            return ListOfTablesListItemWidget(listOfTables[index]);
          },
        ),
      ),
      floatingActionButton: NewButtonWidget(
        "Mesa",
        kTablesModuleNavigatorKey.currentState!.context,
        const CreateTablePage()
      ),
    );
  }
}

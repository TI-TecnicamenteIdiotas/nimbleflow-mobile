import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/widgets/list_of_tables_list_item_widget.dart';

import '../models/table_model.dart';
import 'buttons/new_table_button_widget.dart';

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
      floatingActionButton: const NewTableButtonWidget(),
    );
  }
}

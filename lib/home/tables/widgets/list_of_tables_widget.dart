import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/widgets/list_of_tables_list_item_widget.dart';
import 'package:nimbleflow/shared/models/table/table_model.dart';

import 'buttons/new_table_button.dart';

class ListOfTablesWidget extends StatelessWidget {
  final List<TableModel> tables;

  const ListOfTablesWidget(this.tables, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: tables.length,
          itemBuilder: (_, index) {
            return ListOfTablesListItemWidget(tables[index]);
          },
        ),
      ),
      floatingActionButton: const NewTableButton(),
    );
  }
}

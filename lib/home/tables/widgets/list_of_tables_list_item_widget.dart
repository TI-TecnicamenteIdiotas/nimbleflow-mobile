import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/table/table_page.dart';
import 'package:nimbleflow/shared/models/table/table_model.dart';

class ListOfTablesListItemWidget extends StatelessWidget {
  final TableModel table;

  const ListOfTablesListItemWidget(this.table, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey<String>(table.id),
      elevation: 2,
      child: ListTile(
        title: Text(table.accountable),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TablePage(table),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/pages/table_page.dart';

import '../models/table_model.dart';

class ListOfTablesListItemWidget extends StatelessWidget {
  final TableModel table;

  const ListOfTablesListItemWidget(this.table, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey<String>(table.id),
      elevation: 1,
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

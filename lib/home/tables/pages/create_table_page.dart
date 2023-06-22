import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/dtos/create_table_dto.dart';
import 'package:nimbleflow/home/tables/widgets/table_detailed_widget.dart';

import '../../../shared/widgets/cancel_button_widget.dart';
import '../../../shared/widgets/create_button_widget.dart';
import '../services/table_service.dart';

class CreateTablePage extends StatefulWidget {
  const CreateTablePage({super.key});

  @override
  State<CreateTablePage> createState() => _CreateTablePageState();
}

class _CreateTablePageState extends State<CreateTablePage> {
  final formKey = GlobalKey<FormState>();

  final accountableTextEditingController = TextEditingController();
  bool isFullyPaid = false;

  void setIsFullyPaid(bool value) => setState(() => isFullyPaid = value);

  Future<bool> create() async {
    if (!formKey.currentState!.validate()) return false;

    await TableService.httpPostTable(CreateTableDto(
      accountable: accountableTextEditingController.text,
      isFullyPaid: isFullyPaid,
    ));

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return TableDetailedWidget(
      appBarText: "Nova mesa",
      formKey: formKey,
      accountableTextEditingController: accountableTextEditingController,
      isFullyPaid: isFullyPaid,
      setIsFullyPaid: setIsFullyPaid,
      floatingActionButtons: [
        CreateButtonWidget(onPressed: create),
        const CancelButtonWidget(),
      ],
    );
  }
}

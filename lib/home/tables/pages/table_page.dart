import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/widgets/accountable_text_form_field_widget.dart';
import 'package:nimbleflow/home/tables/services/table_service.dart';
import 'package:nimbleflow/shared/widgets/vertical_floating_action_buttons.dart';

import '../../../shared/widgets/delete_button_widget.dart';
import '../../../shared/widgets/save_button_widget.dart';
import '../dtos/update_table_dto.dart';
import '../models/table_model.dart';
import '../widgets/is_fully_paid_widget.dart';

class TablePage extends StatefulWidget {
  final TableModel table;

  const TablePage(this.table, {super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late final TableModel table;

  final formKey = GlobalKey<FormState>();
  final accountableTextEditingController = TextEditingController();

  void setIsFullyPaid(bool value) => setState(() => table.isFullyPaid = value);

  Future<void> save() async {
    if (!formKey.currentState!.validate()) return;
    table.accountable = accountableTextEditingController.text;

    await TableService.httpPutTable(UpdateTableDto(
      id: table.id,
      accountable: table.accountable,
      isFullyPaid: table.isFullyPaid,
    ));
  }

  Future<void> delete() async {
    await TableService.httpDeleteTable(table.id);
  }

  @override
  void initState() {
    super.initState();
    table = TableModel(
      id: widget.table.id,
      accountable: widget.table.accountable,
      isFullyPaid: widget.table.isFullyPaid,
    );

    accountableTextEditingController.text = table.accountable;
  }

  @override
  void didUpdateWidget(covariant TablePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    table
      ..accountable = widget.table.accountable
      ..isFullyPaid = widget.table.isFullyPaid;

    accountableTextEditingController.text = table.accountable;
  }

  @override
  void dispose() {
    super.dispose();
    accountableTextEditingController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SizedBox.shrink()),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AccountableTextFormFieldWidget(
                  textEditingController: accountableTextEditingController,
                ),
              ),
              IsFullyPaidWidget(
                initialValue: table.isFullyPaid,
                onChanged: setIsFullyPaid,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: VerticalFloatingActionButtons(
        [
          SaveButtonWidget(onPressed: save),
          DeleteButtonWidget(onPressed: delete),
        ],
      ),
    );
  }
}

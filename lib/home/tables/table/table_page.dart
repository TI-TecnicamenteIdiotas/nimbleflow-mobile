import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nimbleflow/home/tables/widgets/accountable_text_form_field_widget.dart';
import 'package:nimbleflow/shared/models/table/table_model.dart';
import 'package:nimbleflow/shared/models/table/update_table_dto.dart';
import 'package:nimbleflow/shared/providers/services/tables_service.dart';

import '../../../shared/widgets/floating_action_button_widget.dart';
import '../widgets/is_paid_widget.dart';

class TablePage extends ConsumerStatefulWidget {
  final TableModel table;

  const TablePage({super.key, required this.table});

  @override
  ConsumerState<TablePage> createState() => _TablePageState();
}

class _TablePageState extends ConsumerState<TablePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _accountableTextEditingController;
  late bool _tempIsFullyPaid;

  void _handleSwitchChange(bool value) {
    setState(() {
      _tempIsFullyPaid = value;
    });
  }

  void _saveTable() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(tablesServiceProvider).httpPutTable(
          UpdateTableDto(
            id: widget.table.id,
            accountable: _accountableTextEditingController.text,
            isFullyPaid: _tempIsFullyPaid,
          ),
        );
  }

  void _deleteTable() async {
    await ref.read(tablesServiceProvider).httpDeleteTable(widget.table.id);
    () => Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _accountableTextEditingController = TextEditingController(
      text: widget.table.accountable,
    );
    _tempIsFullyPaid = widget.table.isFullyPaid;
  }

  @override
  void dispose() {
    super.dispose();
    _accountableTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.table.id)),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AccountableTextFormFieldWidget(
                  textEditingController: _accountableTextEditingController,
                ),
              ),
              IsPaidWidget(
                initialValue: _tempIsFullyPaid,
                onChanged: _handleSwitchChange,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 24,
        children: [
          FloatingActionButtonWidget(
            heroTag: "save",
            icon: const Icon(Icons.save_rounded),
            iconText: "Salvar",
            onPressed: _saveTable,
          ),
          FloatingActionButtonWidget(
            heroTag: "delete",
            icon: const Icon(Icons.delete_rounded),
            iconText: "Deletar",
            onPressed: _deleteTable,
          ),
        ],
      ),
    );
  }
}

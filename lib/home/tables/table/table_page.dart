import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/widgets/accountable_text_form_field_widget.dart';
import 'package:nimbleflow/shared/models/table/table_model.dart';
import 'package:nimbleflow/shared/models/table/update_table_dto.dart';
import 'package:nimbleflow/shared/services/table_service.dart';

import '../widgets/is_paid_widget.dart';
import '../../../shared/widgets/floating_action_button_widget.dart';

class TablePage extends StatefulWidget {
  final TableModel table;
  final void Function(void Function()) setParentState;

  const TablePage({
    super.key,
    required this.table,
    required this.setParentState,
  });

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late final TableModel _table;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _accountableTextEditingController;
  late bool _tempIsFullyPaid;
  bool _isLoading = false;

  void _setIsLoading(bool value) => setState(() => _isLoading = value);

  void _handleSwitchChange(bool value) {
    widget.setParentState(() {
      setState(() {
        _tempIsFullyPaid = value;
      });
    });
  }

  void _handleSave() async {
    _setIsLoading(true);

    if (!_formKey.currentState!.validate()) return;
    _table
      ..accountable = _accountableTextEditingController.text
      ..isFullyPaid = _tempIsFullyPaid;

    await TableService.httpPutTable(UpdateTableDto(
      id: _table.id,
      accountable: _table.accountable,
      isFullyPaid: _table.isFullyPaid,
    ));

    widget.setParentState(() {
      _setIsLoading(false);
    });
  }

  void _closePage() {
    Navigator.pop(context);
  }

  void _handleDelete() async {
    _setIsLoading(true);

    await TableService.httpDeleteTable(_table.id);

    widget.setParentState(() {
      _setIsLoading(false);
    });

    _closePage();
  }

  @override
  void initState() {
    super.initState();
    _table = widget.table;
    _accountableTextEditingController = TextEditingController(
      text: widget.table.accountable,
    );
    _tempIsFullyPaid = widget.table.isFullyPaid;
  }

  @override
  void didUpdateWidget(covariant TablePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _accountableTextEditingController.text = widget.table.accountable;
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
      appBar: AppBar(title: Text(_table.accountable)),
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
            isLoading: _isLoading,
            onPressed: _handleSave,
          ),
          FloatingActionButtonWidget(
            heroTag: "delete",
            icon: const Icon(Icons.delete_rounded),
            iconText: "Deletar",
            isLoading: _isLoading,
            onPressed: _handleDelete,
          ),
        ],
      ),
    );
  }
}

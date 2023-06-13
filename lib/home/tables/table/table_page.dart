import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/models/table/table_model.dart';
import 'package:nimbleflow/shared/models/table/update_table_dto.dart';
import 'package:nimbleflow/shared/services/table_service.dart';
import 'package:nimbleflow/shared/widgets/switch_with_icon_widget.dart';

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
  bool _isLoading = false;

  void _setIsLoading(bool value) => setState(() => _isLoading = value);

  void _handleSwitchTap(bool value) {
    widget.setParentState(() {
      setState(() {
        widget.table.isFullyPaid = value;
      });
    });
  }

  void _handleUpdate() async {
    _setIsLoading(true);

    if (!_formKey.currentState!.validate()) return;
    _table.accountable = _accountableTextEditingController.text;

    await TableService.httpPutTable(UpdateTableDto(
      id: _table.id,
      accountable: _table.accountable,
      isFullyPaid: _table.isFullyPaid,
    ));

    widget.setParentState(() {
      _setIsLoading(false);
    });
  }

  @override
  void initState() {
    super.initState();
    _table = widget.table;
    _accountableTextEditingController = TextEditingController(
      text: widget.table.accountable,
    );
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
      body: Center(
        child: Column(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _accountableTextEditingController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Nome do responsável',
                    hintText: 'Insira um nome',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Insira um nome";
                    }

                    if (value.length > 256) {
                      return "O nome não pode ser maior que 256";
                    }

                    return null;
                  },
                ),
              ),
            ),
            SwitchWithIconWidget(
              title: "Está paga?",
              initialValue: _table.isFullyPaid,
              callback: _handleSwitchTap,
              prefixIcon: const Icon(Icons.attach_money_rounded),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _isLoading ? null : _handleUpdate,
        disabledElevation: 0,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4,
          children: _isLoading
              ? const [
                  CircularProgressIndicator(),
                ]
              : const [
                  Icon(Icons.save_rounded),
                  Text("Atualizar"),
                ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/widgets/buttons/cancel_table_button_widget.dart';
import 'package:nimbleflow/home/tables/widgets/buttons/create_table_button_widget.dart';
import 'package:nimbleflow/home/tables/dtos/create_table_dto.dart';

import '../services/table_service.dart';
import '../widgets/accountable_text_form_field_widget.dart';
import '../widgets/is_fully_paid_widget.dart';

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

  Future<void> create() async {
    if (!formKey.currentState!.validate()) return;

    await TableService.httpPostTable(CreateTableDto(
      accountable: accountableTextEditingController.text,
      isFullyPaid: isFullyPaid,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova mesa")),
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
                initialValue: isFullyPaid,
                onChanged: setIsFullyPaid,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 24,
        children: [
          CreateTableButtonWidget(onPressed: create),
          const CancelTableButtonWidget(),
        ],
      ),
    );
  }
}

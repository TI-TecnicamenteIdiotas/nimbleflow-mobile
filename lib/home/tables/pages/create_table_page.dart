import 'package:flutter/material.dart';
import 'package:nimbleflow/home/tables/dtos/create_table_dto.dart';
import 'package:nimbleflow/shared/widgets/vertical_floating_action_buttons.dart';

import '../../../shared/widgets/cancel_button_widget.dart';
import '../../../shared/widgets/create_button_widget.dart';
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
      floatingActionButton: VerticalFloatingActionButtons(
        [
          CreateButtonWidget(onPressed: create),
          const CancelButtonWidget(),
        ],
      ),
    );
  }
}

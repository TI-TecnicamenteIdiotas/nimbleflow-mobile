import 'package:flutter/material.dart';

import '../../../shared/widgets/vertical_floating_action_buttons.dart';
import 'accountable_text_form_field_widget.dart';
import 'is_fully_paid_widget.dart';

class TableDetailedWidget extends StatelessWidget {
  final String? appBarText;
  final GlobalKey<FormState> formKey;
  final TextEditingController accountableTextEditingController;
  final bool isFullyPaid;
  final void Function(bool value) setIsFullyPaid;
  final List<Widget> floatingActionButtons;

  const TableDetailedWidget({
    super.key,
    this.appBarText,
    required this.formKey,
    required this.accountableTextEditingController,
    required this.isFullyPaid,
    required this.setIsFullyPaid,
    required this.floatingActionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarText == null ? null : Text(appBarText!)),
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
        floatingActionButtons,
      ),
    );
  }
}

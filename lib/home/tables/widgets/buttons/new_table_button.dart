import 'package:flutter/material.dart';

import '../../../../shared/constants/global_keys_constants.dart';
import '../../../../shared/widgets/floating_action_button_widget.dart';
import '../../table/create_table_page.dart';

class NewTableButton extends StatefulWidget {
  const NewTableButton({super.key});

  @override
  State<NewTableButton> createState() => _NewTableButtonState();
}

class _NewTableButtonState extends State<NewTableButton> {
  var showButton = true;
  void setShowButton(bool value) => setState(() => showButton = value);

  void onPressed() async {
    setShowButton(false);
    await Navigator.push(
      kTablesModuleNavigatorKey.currentContext ?? context,
      MaterialPageRoute(
        builder: (_) => const CreateTablePage(),
      ),
    );
    setShowButton(true);
  }

  @override
  Widget build(BuildContext context) {
    if (!showButton) return const SizedBox.shrink();

    return FloatingActionButtonWidget(
      heroTag: "new",
      isLoading: false,
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      iconText: "Nova mesa",
    );
  }
}

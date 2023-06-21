import 'package:flutter/material.dart';

import '../../../../shared/constants/global_keys_constants.dart';
import '../../../../shared/widgets/floating_action_button_widget.dart';
import '../../pages/create_table_page.dart';

class NewTableButtonWidget extends StatelessWidget {
  const NewTableButtonWidget({super.key});

  void onPressed() {
    Navigator.push(
      kTablesModuleNavigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => const CreateTablePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonWidget(
      heroTag: "new",
      isLoading: false,
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      iconText: "Mesa",
    );
  }
}

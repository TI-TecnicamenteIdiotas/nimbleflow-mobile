import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';
import 'package:nimbleflow/shared/widgets/floating_action_button_widget.dart';

import '../../pages/create_category_page.dart';

class NewCategoryButtonWidget extends StatelessWidget {
  const NewCategoryButtonWidget({super.key});

  void onPressed() {
    Navigator.push(
      kCategoriesModuleNavigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => const CreateCategoryPage(),
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
      iconText: "Categoria",
    );
  }
}

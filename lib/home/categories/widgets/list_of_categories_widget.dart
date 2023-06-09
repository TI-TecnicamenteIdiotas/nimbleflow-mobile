import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/categories/pages/create_category_page.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';

import '../../../shared/widgets/new_button_widget.dart';
import 'list_of_categories_list_item_widget.dart';

class ListOfCategoriesWidget extends StatelessWidget {
  final List<CategoryModel> listOfCategories;

  const ListOfCategoriesWidget(this.listOfCategories, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listOfCategories.length,
          itemBuilder: (_, index) {
            return ListOfCategoriesListItemWidget(listOfCategories[index]);
          },
        ),
      ),
      floatingActionButton: NewButtonWidget(
        "Categoria",
        kCategoriesModuleNavigatorKey.currentState!.context,
        const CreateCategoryPage(),
      ),
    );
  }
}

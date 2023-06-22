import 'package:flutter/material.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';

import '../../../shared/widgets/new_button_widget.dart';
import '../models/product_model_with_relations.dart';
import '../pages/create_product_page.dart';
import 'list_of_products_list_item_widget.dart';

class ListOfProductsWidget extends StatelessWidget {
  final List<ProductModelWithRelations> listOfProductsWithRelations;

  const ListOfProductsWidget(this.listOfProductsWithRelations, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listOfProductsWithRelations.length,
          itemBuilder: (_, index) {
            return ListOfProductsListItemWidget(
              listOfProductsWithRelations[index],
            );
          },
        ),
      ),
      floatingActionButton: NewButtonWidget(
          "Produto",
          kProductsModuleNavigatorKey.currentState!.context,
          const CreateProductPage()),
    );
  }
}

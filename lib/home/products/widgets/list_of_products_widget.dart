import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/models/product_model.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';

import '../../../shared/widgets/new_button_widget.dart';
import '../pages/create_product_page.dart';
import 'list_of_products_list_item_widget.dart';

class ListOfProductsWidget extends StatelessWidget {
  final List<ProductModel> listOfProducts;

  const ListOfProductsWidget(this.listOfProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listOfProducts.length,
          itemBuilder: (_, index) {
            return ListOfProductsListItemWidget(listOfProducts[index]);
          },
        ),
      ),
      floatingActionButton: NewButtonWidget(
          "Produto",
          kProductsModuleNavigatorKey.currentState!.context,
          const CreateProductPage()
      ),
    );
  }
}

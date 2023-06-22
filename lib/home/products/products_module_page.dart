import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/models/product_model_with_relations.dart';
import 'package:nimbleflow/home/products/utils/product_hub_subscribers.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';

import '../../shared/services/hub_service.dart';
import '../../shared/storage/storage.dart';
import '../../shared/widgets/loading_dialog_widget.dart';
import 'widgets/list_of_products_widget.dart';

class ProductsModulePage extends StatefulWidget {
  final List<ProductModelWithRelations> listOfProducts;
  final bool isLoading;

  const ProductsModulePage(this.listOfProducts, this.isLoading, {super.key});

  @override
  State<ProductsModulePage> createState() => _ProductsModulePageState();
}

class _ProductsModulePageState extends State<ProductsModulePage> {
  late final ProductHubSubscriber productHubSubscribers;

  @override
  void initState() {
    super.initState();

    productHubSubscribers = ProductHubSubscriber(
      widget.listOfProducts,
      HubService.mainHubConnection,
      Storage.storage,
      setState,
    );
  }

  @override
  void dispose() {
    super.dispose();
    productHubSubscribers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: MaterialApp(
        theme: Theme.of(context),
        debugShowCheckedModeBanner: false,
        navigatorKey: kProductsModuleNavigatorKey,
        home: Builder(
          builder: (_) {
            if (widget.isLoading) {
              return const Center(child: LoadingDialogWidget());
            }
            return ListOfProductsWidget(widget.listOfProducts);
          },
        ),
      ),
    );
  }
}

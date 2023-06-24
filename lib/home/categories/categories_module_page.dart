import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/utils/category_hub_subscribers.dart';
import 'package:nimbleflow/home/categories/widgets/list_of_categories_widget.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/shared/services/hub_service.dart';
import 'package:nimbleflow/shared/storage/storage.dart';

import '../../shared/widgets/loading_dialog_widget.dart';

class CategoriesModulePage extends StatefulWidget {
  final List<CategoryModel> listOfCategories;
  final bool isLoading;

  const CategoriesModulePage(this.listOfCategories, this.isLoading,
      {super.key});

  @override
  State<CategoriesModulePage> createState() => _CategoriesModulePageState();
}

class _CategoriesModulePageState extends State<CategoriesModulePage> {
  late final CategoryHubSubscriber categoryHubSubscriber;

  @override
  void initState() {
    super.initState();
    categoryHubSubscriber = CategoryHubSubscriber(
      widget.listOfCategories,
      HubService.mainHubConnection,
      Storage.storage,
      setState,
    );
  }

  @override
  void dispose() {
    super.dispose();
    categoryHubSubscriber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categorias")),
      body: MaterialApp(
        theme: Theme.of(context),
        debugShowCheckedModeBanner: false,
        navigatorKey: kCategoriesModuleNavigatorKey,
        home: Builder(
          builder: (_) {
            if (widget.isLoading) {
              return const Center(child: LoadingDialogWidget());
            }
            return ListOfCategoriesWidget(widget.listOfCategories);
          },
        ),
      ),
    );
  }
}

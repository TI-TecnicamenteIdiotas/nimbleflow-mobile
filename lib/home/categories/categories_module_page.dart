import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/utils/hub_subscribers.dart';
import 'package:nimbleflow/home/categories/utils/init_categories.dart';
import 'package:nimbleflow/home/categories/widgets/list_of_categories_widget.dart';
import 'package:nimbleflow/shared/constants/global_keys_constants.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/shared/services/hub_service.dart';
import 'package:nimbleflow/shared/storage/storage.dart';

import '../../shared/widgets/loading_dialog_widget.dart';

class CategoriesModulePage extends StatefulWidget {
  const CategoriesModulePage({super.key});

  @override
  State<CategoriesModulePage> createState() => _CategoriesModulePageState();
}

class _CategoriesModulePageState extends State<CategoriesModulePage> {
  late final CategoryHubSubscriber categoryHubSubscriber;

  bool isLoading = false;
  final listOfCategories = List<CategoryModel>.empty(growable: true);

  void setIsLoading(bool value) => setState(() => isLoading = value);

  @override
  void initState() {
    super.initState();
    var page = 0;

    categoryHubSubscriber = CategoryHubSubscriber(
      listOfCategories,
      HubService.mainHubConnection,
      Storage.storage,
      setState,
    );
    initCategories(listOfCategories, page, setIsLoading);
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
            if (isLoading) return const Center(child: LoadingDialogWidget());
            return ListOfCategoriesWidget(listOfCategories);
          },
        ),
      ),
    );
  }
}

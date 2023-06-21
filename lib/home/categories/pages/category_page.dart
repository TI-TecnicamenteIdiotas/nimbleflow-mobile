import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';

class CategoryPage extends StatefulWidget {
  final CategoryModel category;

  const CategoryPage(this.category, {super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SizedBox.shrink()),
    );
  }
}

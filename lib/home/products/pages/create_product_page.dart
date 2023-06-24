import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nimbleflow/home/products/dtos/create_product_dto.dart';
import 'package:nimbleflow/home/products/services/product_service.dart';
import 'package:nimbleflow/home/products/services/upload_service.dart';
import 'package:nimbleflow/shared/widgets/cancel_button_widget.dart';
import 'package:nimbleflow/shared/widgets/create_button_widget.dart';

import '../../categories/models/category_model.dart';
import '../widgets/product_detailed_widget.dart';

class CreateProductPage extends StatefulWidget {
  final List<CategoryModel> listOfCategories;

  const CreateProductPage(this.listOfCategories, {super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final formKey = GlobalKey<FormState>();
  final titleTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final priceTextEditingController = TextEditingController();

  File? imageFile;
  String? imageUrl;
  bool isFavorite = false;
  CategoryModel? category;

  void setImageUrl(String value) {
    setState(() {
      imageUrl = value;

      if (imageUrl != null) {
        imageFile = File(imageUrl!);
      }
    });
  }

  void setIsFavorite(bool value) => setState(() => isFavorite = value);

  void setCategory(CategoryModel? value) {
    setState(() => category = value);
  }

  Future<bool> create() async {
    if (!formKey.currentState!.validate()) return false;

    if (imageFile != null) {
      imageUrl = await UploadService.httpPostImage(imageFile!);
    }

    ProductService.httpPostProduct(
      CreateProductDto(
        title: titleTextEditingController.text,
        description: descriptionTextEditingController.text,
        price: num.parse(priceTextEditingController.text),
        imageUrl: imageUrl,
        isFavorite: isFavorite,
        categoryId: category!.id,
      ),
    );

    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    priceTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProductDetailedWidget(
      appBarText: "Novo produto",
      formKey: formKey,
      titleTextEditingController: titleTextEditingController,
      descriptionTextEditingController: descriptionTextEditingController,
      priceTextEditingController: priceTextEditingController,
      imageUrl: imageUrl,
      setImageUrl: setImageUrl,
      isFavorite: isFavorite,
      setIsFavorite: setIsFavorite,
      listOfCategories: widget.listOfCategories,
      category: category,
      setCategory: setCategory,
      floatingActionButtons: [
        CreateButtonWidget(onPressed: create),
        const CancelButtonWidget()
      ],
    );
  }
}

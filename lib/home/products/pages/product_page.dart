import 'package:flutter/material.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/products/dtos/update_product_dto.dart';
import 'package:nimbleflow/home/products/services/product_service.dart';
import 'package:nimbleflow/shared/widgets/delete_button_widget.dart';
import 'package:nimbleflow/shared/widgets/save_button_widget.dart';
import '../models/product_model_with_relations.dart';
import '../widgets/product_detailed_widget.dart';

class ProductPage extends StatefulWidget {
  final ProductModelWithRelations product;
  final List<CategoryModel> listOfCategories;

  const ProductPage(this.product, this.listOfCategories, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final titleTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final priceTextEditingController = TextEditingController();

  String? imageUrl;
  late bool isFavorite;
  CategoryModel? category;

  void setImageUrl(String value) => setState(() => imageUrl = value);

  void setIsFavorite(bool value) => setState(() => isFavorite = value);

  void setCategory(CategoryModel? value) => setState(() => category = value);

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    ProductService.httpPutProduct(UpdateProductDto(
      id: widget.product.id,
      title: titleTextEditingController.text,
      description: descriptionTextEditingController.text,
      price: num.parse(priceTextEditingController.text),
      imageUrl: imageUrl,
      isFavorite: isFavorite,
      categoryId: category!.id,
    ));

    return true;
  }

  Future<void> delete() async {
    await ProductService.httpDeleteProduct(widget.product.id);
  }

  @override
  void initState() {
    super.initState();
    titleTextEditingController.text = widget.product.title;
    descriptionTextEditingController.text = widget.product.description ?? "";
    priceTextEditingController.text = widget.product.price.toStringAsFixed(2);

    imageUrl = widget.product.imageUrl;
    isFavorite = widget.product.isFavorite;
    category = widget.product.category;
  }

  @override
  void didUpdateWidget(covariant ProductPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    titleTextEditingController.text = widget.product.title;
    descriptionTextEditingController.text = widget.product.description ?? "";
    priceTextEditingController.text = widget.product.price.toStringAsFixed(2);

    imageUrl = widget.product.imageUrl;
    isFavorite = widget.product.isFavorite;
    category = widget.product.category;
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
        SaveButtonWidget(onPressed: save),
        DeleteButtonWidget(onPressed: delete)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nimbleflow/home/categories/models/category_model.dart';
import 'package:nimbleflow/home/products/widgets/change_image_button_widget.dart';
import 'package:nimbleflow/home/products/widgets/choose_image_widget.dart';
import 'package:nimbleflow/home/products/widgets/description_text_form_field_widget.dart';
import 'package:nimbleflow/home/products/widgets/is_fully_paid_widget.dart';
import 'package:nimbleflow/home/products/widgets/price_text_form_field_widget.dart';
import 'package:nimbleflow/home/products/widgets/select_category_drop_down_button_widget.dart';
import 'package:nimbleflow/shared/widgets/vertical_floating_action_buttons.dart';

import '../../../shared/layout_utils.dart';
import 'title_text_form_field_widget.dart';

class ProductDetailedWidget extends StatelessWidget {
  final String? appBarText;
  final GlobalKey<FormState> formKey;
  final TextEditingController titleTextEditingController;
  final TextEditingController descriptionTextEditingController;
  final TextEditingController priceTextEditingController;
  final String? imageUrl;
  final void Function(String value) setImageUrl;
  final bool isFavorite;
  final void Function(bool value) setIsFavorite;
  final List<CategoryModel> listOfCategories;
  final CategoryModel? category;
  final void Function(CategoryModel? value) setCategory;
  final List<Widget> floatingActionButtons;

  const ProductDetailedWidget({
    super.key,
    this.appBarText,
    required this.formKey,
    required this.titleTextEditingController,
    required this.descriptionTextEditingController,
    required this.priceTextEditingController,
    required this.imageUrl,
    required this.setImageUrl,
    required this.isFavorite,
    required this.setIsFavorite,
    required this.listOfCategories,
    required this.category,
    required this.setCategory,
    required this.floatingActionButtons,
  });

  void showImageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ChooseImageWidget(
          context,
          selectImageFromGallery,
          selectImageFromCamera,
        );
      },
    );
  }

  Future<bool> selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return false;

    setImageUrl(image.path);
    return true;
  }

  Future<bool> selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) return false;

    setImageUrl(photo.path);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText == null ? null : Text(appBarText!),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: getImageByUrl(imageUrl, 128),
                  ),
                  TitleTextFormFieldWidget(
                    titleTextEditingController,
                  ),
                  const SizedBox(height: 12),
                  DescriptionTextFormFieldWidget(
                    descriptionTextEditingController,
                  ),
                  const SizedBox(height: 12),
                  PriceTextFormFieldWidget(
                    priceTextEditingController,
                  ),
                  const SizedBox(height: 12),
                  SelectCategoryDropDownButtonWidget(
                    category,
                    listOfCategories,
                    setCategory,
                  ),
                  const SizedBox(height: 12),
                  IsFavoriteWidget(
                    initialValue: isFavorite,
                    onChanged: setIsFavorite,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ChangeImageButtonWidget(
                      imageUrl,
                      () => showImageSelectionDialog(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: VerticalFloatingActionButtons(
        floatingActionButtons,
      ),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part "product_model.freezed.dart";

part "product_model.g.dart";

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String title,
    String? description,
    required num price,
    String? imageUrl,
    required bool isFavorite,
    required String categoryId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}

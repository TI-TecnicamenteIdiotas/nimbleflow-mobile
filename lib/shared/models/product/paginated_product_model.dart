import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nimbleflow/shared/models/product/product_model.dart';

part "paginated_product_model.freezed.dart";

part "paginated_product_model.g.dart";

@freezed
class PaginatedProductModel with _$PaginatedProductModel {
  const factory PaginatedProductModel({
    required int totalItems,
    required List<ProductModel> items,
  }) = _PaginatedProductModel;

  factory PaginatedProductModel.fromJson(Map<String, Object?> json) =>
      _$PaginatedProductModelFromJson(json);
}

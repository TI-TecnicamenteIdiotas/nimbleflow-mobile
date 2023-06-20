import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nimbleflow/shared/models/category/category_model.dart';

part "paginated_category_model.freezed.dart";

part "paginated_category_model.g.dart";

@freezed
class PaginatedCategoryModel with _$PaginatedCategoryModel {
  const factory PaginatedCategoryModel({
    required int totalItems,
    required List<CategoryModel> items,
  }) = _PaginatedCategoryModel;

  factory PaginatedCategoryModel.fromJson(Map<String, Object?> json) =>
      _$PaginatedCategoryModelFromJson(json);
}

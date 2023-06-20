// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedCategoryModel _$$_PaginatedCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedCategoryModel(
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaginatedCategoryModelToJson(
        _$_PaginatedCategoryModel instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

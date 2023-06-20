// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedProductModel _$$_PaginatedProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedProductModel(
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaginatedProductModelToJson(
        _$_PaginatedProductModel instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

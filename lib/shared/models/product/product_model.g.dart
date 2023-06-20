// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      price: json['price'] as num,
      imageUrl: json['imageUrl'] as String?,
      isFavorite: json['isFavorite'] as bool,
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'isFavorite': instance.isFavorite,
      'categoryId': instance.categoryId,
    };

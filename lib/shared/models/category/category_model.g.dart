// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      colorTheme: json['colorTheme'] as int?,
      categoryIcon: json['categoryIcon'] as int?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'colorTheme': instance.colorTheme,
      'categoryIcon': instance.categoryIcon,
    };
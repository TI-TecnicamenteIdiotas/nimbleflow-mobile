// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_tables_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedTableModel _$$_PaginatedTableModelFromJson(
        Map<String, dynamic> json) =>
    _$_PaginatedTableModel(
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => TableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaginatedTableModelToJson(
        _$_PaginatedTableModel instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

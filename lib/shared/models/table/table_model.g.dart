// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableModel _$$_TableModelFromJson(Map<String, dynamic> json) =>
    _$_TableModel(
      id: json['id'] as String,
      accountable: json['accountable'] as String,
      isFullyPaid: json['isFullyPaid'] as bool,
    );

Map<String, dynamic> _$$_TableModelToJson(_$_TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountable': instance.accountable,
      'isFullyPaid': instance.isFullyPaid,
    };

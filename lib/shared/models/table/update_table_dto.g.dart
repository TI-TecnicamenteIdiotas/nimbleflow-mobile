// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_table_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateTableDto _$$_UpdateTableDtoFromJson(Map<String, dynamic> json) =>
    _$_UpdateTableDto(
      id: json['id'] as String,
      accountable: json['accountable'] as String?,
      isFullyPaid: json['isFullyPaid'] as bool?,
    );

Map<String, dynamic> _$$_UpdateTableDtoToJson(_$_UpdateTableDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountable': instance.accountable,
      'isFullyPaid': instance.isFullyPaid,
    };

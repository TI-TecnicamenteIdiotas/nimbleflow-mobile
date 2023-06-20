import 'package:freezed_annotation/freezed_annotation.dart';

part "update_table_dto.freezed.dart";

part "update_table_dto.g.dart";

@freezed
class UpdateTableDto with _$UpdateTableDto {
  const factory UpdateTableDto({
    required String id,
    String? accountable,
    bool? isFullyPaid,
  }) = _UpdateTableDto;

  factory UpdateTableDto.fromJson(Map<String, Object?> json) =>
      _$UpdateTableDtoFromJson(json);
}

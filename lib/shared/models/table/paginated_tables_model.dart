import 'package:freezed_annotation/freezed_annotation.dart';
import './table_model.dart';

part "paginated_tables_model.freezed.dart";

part "paginated_tables_model.g.dart";

@unfreezed
class PaginatedTablesModel with _$PaginatedTablesModel {
  factory PaginatedTablesModel({
    required int totalItems,
    required List<TableModel> items,
  }) = _PaginatedTableModel;

  factory PaginatedTablesModel.fromJson(Map<String, Object?> json) =>
      _$PaginatedTablesModelFromJson(json);
}

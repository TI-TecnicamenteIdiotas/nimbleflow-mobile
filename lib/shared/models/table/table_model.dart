import 'package:freezed_annotation/freezed_annotation.dart';

part "table_model.g.dart";

part "table_model.freezed.dart";

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required String id,
    required String accountable,
    required bool isFullyPaid,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, Object?> json) =>
      _$TableModelFromJson(json);

  static toStorageMap(TableModel tableModel) => {
        "id": tableModel.id,
        "accountable": tableModel.accountable,
        "isFullyPaid": tableModel.isFullyPaid ? 1 : 0,
      };

  factory TableModel.fromStorage(Map<String, Object?> json) {
    return TableModel(
      id: json["id"] as String,
      accountable: json["accountable"] as String,
      isFullyPaid: json["isFullyPaid"] == 1 ? true : false,
    );
  }
}

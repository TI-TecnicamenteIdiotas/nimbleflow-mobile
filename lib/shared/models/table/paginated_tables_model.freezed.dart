// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_tables_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedTablesModel _$PaginatedTablesModelFromJson(Map<String, dynamic> json) {
  return _PaginatedTableModel.fromJson(json);
}

/// @nodoc
mixin _$PaginatedTablesModel {
  int get totalItems => throw _privateConstructorUsedError;
  set totalItems(int value) => throw _privateConstructorUsedError;
  List<TableModel> get items => throw _privateConstructorUsedError;
  set items(List<TableModel> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedTablesModelCopyWith<PaginatedTablesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedTablesModelCopyWith<$Res> {
  factory $PaginatedTablesModelCopyWith(PaginatedTablesModel value,
          $Res Function(PaginatedTablesModel) then) =
      _$PaginatedTablesModelCopyWithImpl<$Res, PaginatedTablesModel>;
  @useResult
  $Res call({int totalItems, List<TableModel> items});
}

/// @nodoc
class _$PaginatedTablesModelCopyWithImpl<$Res,
        $Val extends PaginatedTablesModel>
    implements $PaginatedTablesModelCopyWith<$Res> {
  _$PaginatedTablesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginatedTableModelCopyWith<$Res>
    implements $PaginatedTablesModelCopyWith<$Res> {
  factory _$$_PaginatedTableModelCopyWith(_$_PaginatedTableModel value,
          $Res Function(_$_PaginatedTableModel) then) =
      __$$_PaginatedTableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalItems, List<TableModel> items});
}

/// @nodoc
class __$$_PaginatedTableModelCopyWithImpl<$Res>
    extends _$PaginatedTablesModelCopyWithImpl<$Res, _$_PaginatedTableModel>
    implements _$$_PaginatedTableModelCopyWith<$Res> {
  __$$_PaginatedTableModelCopyWithImpl(_$_PaginatedTableModel _value,
      $Res Function(_$_PaginatedTableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_$_PaginatedTableModel(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginatedTableModel implements _PaginatedTableModel {
  _$_PaginatedTableModel({required this.totalItems, required this.items});

  factory _$_PaginatedTableModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaginatedTableModelFromJson(json);

  @override
  int totalItems;
  @override
  List<TableModel> items;

  @override
  String toString() {
    return 'PaginatedTablesModel(totalItems: $totalItems, items: $items)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedTableModelCopyWith<_$_PaginatedTableModel> get copyWith =>
      __$$_PaginatedTableModelCopyWithImpl<_$_PaginatedTableModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedTableModelToJson(
      this,
    );
  }
}

abstract class _PaginatedTableModel implements PaginatedTablesModel {
  factory _PaginatedTableModel(
      {required int totalItems,
      required List<TableModel> items}) = _$_PaginatedTableModel;

  factory _PaginatedTableModel.fromJson(Map<String, dynamic> json) =
      _$_PaginatedTableModel.fromJson;

  @override
  int get totalItems;
  set totalItems(int value);
  @override
  List<TableModel> get items;
  set items(List<TableModel> value);
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedTableModelCopyWith<_$_PaginatedTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

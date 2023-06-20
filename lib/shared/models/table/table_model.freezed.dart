// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  String get id => throw _privateConstructorUsedError;
  String get accountable => throw _privateConstructorUsedError;
  bool get isFullyPaid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call({String id, String accountable, bool isFullyPaid});
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountable = null,
    Object? isFullyPaid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountable: null == accountable
          ? _value.accountable
          : accountable // ignore: cast_nullable_to_non_nullable
              as String,
      isFullyPaid: null == isFullyPaid
          ? _value.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableModelCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$_TableModelCopyWith(
          _$_TableModel value, $Res Function(_$_TableModel) then) =
      __$$_TableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String accountable, bool isFullyPaid});
}

/// @nodoc
class __$$_TableModelCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$_TableModel>
    implements _$$_TableModelCopyWith<$Res> {
  __$$_TableModelCopyWithImpl(
      _$_TableModel _value, $Res Function(_$_TableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountable = null,
    Object? isFullyPaid = null,
  }) {
    return _then(_$_TableModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountable: null == accountable
          ? _value.accountable
          : accountable // ignore: cast_nullable_to_non_nullable
              as String,
      isFullyPaid: null == isFullyPaid
          ? _value.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableModel implements _TableModel {
  const _$_TableModel(
      {required this.id, required this.accountable, required this.isFullyPaid});

  factory _$_TableModel.fromJson(Map<String, dynamic> json) =>
      _$$_TableModelFromJson(json);

  @override
  final String id;
  @override
  final String accountable;
  @override
  final bool isFullyPaid;

  @override
  String toString() {
    return 'TableModel(id: $id, accountable: $accountable, isFullyPaid: $isFullyPaid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountable, accountable) ||
                other.accountable == accountable) &&
            (identical(other.isFullyPaid, isFullyPaid) ||
                other.isFullyPaid == isFullyPaid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, accountable, isFullyPaid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableModelCopyWith<_$_TableModel> get copyWith =>
      __$$_TableModelCopyWithImpl<_$_TableModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableModelToJson(
      this,
    );
  }
}

abstract class _TableModel implements TableModel {
  const factory _TableModel(
      {required final String id,
      required final String accountable,
      required final bool isFullyPaid}) = _$_TableModel;

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$_TableModel.fromJson;

  @override
  String get id;
  @override
  String get accountable;
  @override
  bool get isFullyPaid;
  @override
  @JsonKey(ignore: true)
  _$$_TableModelCopyWith<_$_TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

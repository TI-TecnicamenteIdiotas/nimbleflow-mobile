// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_table_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateTableDto _$UpdateTableDtoFromJson(Map<String, dynamic> json) {
  return _UpdateTableDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateTableDto {
  String get id => throw _privateConstructorUsedError;
  String? get accountable => throw _privateConstructorUsedError;
  bool? get isFullyPaid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTableDtoCopyWith<UpdateTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTableDtoCopyWith<$Res> {
  factory $UpdateTableDtoCopyWith(
          UpdateTableDto value, $Res Function(UpdateTableDto) then) =
      _$UpdateTableDtoCopyWithImpl<$Res, UpdateTableDto>;
  @useResult
  $Res call({String id, String? accountable, bool? isFullyPaid});
}

/// @nodoc
class _$UpdateTableDtoCopyWithImpl<$Res, $Val extends UpdateTableDto>
    implements $UpdateTableDtoCopyWith<$Res> {
  _$UpdateTableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountable = freezed,
    Object? isFullyPaid = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountable: freezed == accountable
          ? _value.accountable
          : accountable // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyPaid: freezed == isFullyPaid
          ? _value.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateTableDtoCopyWith<$Res>
    implements $UpdateTableDtoCopyWith<$Res> {
  factory _$$_UpdateTableDtoCopyWith(
          _$_UpdateTableDto value, $Res Function(_$_UpdateTableDto) then) =
      __$$_UpdateTableDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? accountable, bool? isFullyPaid});
}

/// @nodoc
class __$$_UpdateTableDtoCopyWithImpl<$Res>
    extends _$UpdateTableDtoCopyWithImpl<$Res, _$_UpdateTableDto>
    implements _$$_UpdateTableDtoCopyWith<$Res> {
  __$$_UpdateTableDtoCopyWithImpl(
      _$_UpdateTableDto _value, $Res Function(_$_UpdateTableDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountable = freezed,
    Object? isFullyPaid = freezed,
  }) {
    return _then(_$_UpdateTableDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountable: freezed == accountable
          ? _value.accountable
          : accountable // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyPaid: freezed == isFullyPaid
          ? _value.isFullyPaid
          : isFullyPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateTableDto implements _UpdateTableDto {
  const _$_UpdateTableDto(
      {required this.id, this.accountable, this.isFullyPaid});

  factory _$_UpdateTableDto.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTableDtoFromJson(json);

  @override
  final String id;
  @override
  final String? accountable;
  @override
  final bool? isFullyPaid;

  @override
  String toString() {
    return 'UpdateTableDto(id: $id, accountable: $accountable, isFullyPaid: $isFullyPaid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTableDto &&
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
  _$$_UpdateTableDtoCopyWith<_$_UpdateTableDto> get copyWith =>
      __$$_UpdateTableDtoCopyWithImpl<_$_UpdateTableDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTableDtoToJson(
      this,
    );
  }
}

abstract class _UpdateTableDto implements UpdateTableDto {
  const factory _UpdateTableDto(
      {required final String id,
      final String? accountable,
      final bool? isFullyPaid}) = _$_UpdateTableDto;

  factory _UpdateTableDto.fromJson(Map<String, dynamic> json) =
      _$_UpdateTableDto.fromJson;

  @override
  String get id;
  @override
  String? get accountable;
  @override
  bool? get isFullyPaid;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateTableDtoCopyWith<_$_UpdateTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

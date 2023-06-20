// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginatedProductModel _$PaginatedProductModelFromJson(
    Map<String, dynamic> json) {
  return _PaginatedProductModel.fromJson(json);
}

/// @nodoc
mixin _$PaginatedProductModel {
  int get totalItems => throw _privateConstructorUsedError;
  List<ProductModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedProductModelCopyWith<PaginatedProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedProductModelCopyWith<$Res> {
  factory $PaginatedProductModelCopyWith(PaginatedProductModel value,
          $Res Function(PaginatedProductModel) then) =
      _$PaginatedProductModelCopyWithImpl<$Res, PaginatedProductModel>;
  @useResult
  $Res call({int totalItems, List<ProductModel> items});
}

/// @nodoc
class _$PaginatedProductModelCopyWithImpl<$Res,
        $Val extends PaginatedProductModel>
    implements $PaginatedProductModelCopyWith<$Res> {
  _$PaginatedProductModelCopyWithImpl(this._value, this._then);

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
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginatedProductModelCopyWith<$Res>
    implements $PaginatedProductModelCopyWith<$Res> {
  factory _$$_PaginatedProductModelCopyWith(_$_PaginatedProductModel value,
          $Res Function(_$_PaginatedProductModel) then) =
      __$$_PaginatedProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalItems, List<ProductModel> items});
}

/// @nodoc
class __$$_PaginatedProductModelCopyWithImpl<$Res>
    extends _$PaginatedProductModelCopyWithImpl<$Res, _$_PaginatedProductModel>
    implements _$$_PaginatedProductModelCopyWith<$Res> {
  __$$_PaginatedProductModelCopyWithImpl(_$_PaginatedProductModel _value,
      $Res Function(_$_PaginatedProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_$_PaginatedProductModel(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginatedProductModel implements _PaginatedProductModel {
  const _$_PaginatedProductModel(
      {required this.totalItems, required final List<ProductModel> items})
      : _items = items;

  factory _$_PaginatedProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaginatedProductModelFromJson(json);

  @override
  final int totalItems;
  final List<ProductModel> _items;
  @override
  List<ProductModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PaginatedProductModel(totalItems: $totalItems, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedProductModel &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalItems, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginatedProductModelCopyWith<_$_PaginatedProductModel> get copyWith =>
      __$$_PaginatedProductModelCopyWithImpl<_$_PaginatedProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginatedProductModelToJson(
      this,
    );
  }
}

abstract class _PaginatedProductModel implements PaginatedProductModel {
  const factory _PaginatedProductModel(
      {required final int totalItems,
      required final List<ProductModel> items}) = _$_PaginatedProductModel;

  factory _PaginatedProductModel.fromJson(Map<String, dynamic> json) =
      _$_PaginatedProductModel.fromJson;

  @override
  int get totalItems;
  @override
  List<ProductModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedProductModelCopyWith<_$_PaginatedProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

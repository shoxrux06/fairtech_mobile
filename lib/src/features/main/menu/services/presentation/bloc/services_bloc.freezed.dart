// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServicesState {
  ProductInfoResponse? get productInfoResponse =>
      throw _privateConstructorUsedError;
  bool get isGettingProductData => throw _privateConstructorUsedError;
  bool get isGotProductData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res, ServicesState>;
  @useResult
  $Res call(
      {ProductInfoResponse? productInfoResponse,
      bool isGettingProductData,
      bool isGotProductData});
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res, $Val extends ServicesState>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productInfoResponse = freezed,
    Object? isGettingProductData = null,
    Object? isGotProductData = null,
  }) {
    return _then(_value.copyWith(
      productInfoResponse: freezed == productInfoResponse
          ? _value.productInfoResponse
          : productInfoResponse // ignore: cast_nullable_to_non_nullable
              as ProductInfoResponse?,
      isGettingProductData: null == isGettingProductData
          ? _value.isGettingProductData
          : isGettingProductData // ignore: cast_nullable_to_non_nullable
              as bool,
      isGotProductData: null == isGotProductData
          ? _value.isGotProductData
          : isGotProductData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductInfoResponse? productInfoResponse,
      bool isGettingProductData,
      bool isGotProductData});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productInfoResponse = freezed,
    Object? isGettingProductData = null,
    Object? isGotProductData = null,
  }) {
    return _then(_$InitialImpl(
      productInfoResponse: freezed == productInfoResponse
          ? _value.productInfoResponse
          : productInfoResponse // ignore: cast_nullable_to_non_nullable
              as ProductInfoResponse?,
      isGettingProductData: null == isGettingProductData
          ? _value.isGettingProductData
          : isGettingProductData // ignore: cast_nullable_to_non_nullable
              as bool,
      isGotProductData: null == isGotProductData
          ? _value.isGotProductData
          : isGotProductData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {this.productInfoResponse,
      this.isGettingProductData = false,
      this.isGotProductData = false});

  @override
  final ProductInfoResponse? productInfoResponse;
  @override
  @JsonKey()
  final bool isGettingProductData;
  @override
  @JsonKey()
  final bool isGotProductData;

  @override
  String toString() {
    return 'ServicesState(productInfoResponse: $productInfoResponse, isGettingProductData: $isGettingProductData, isGotProductData: $isGotProductData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.productInfoResponse, productInfoResponse) ||
                other.productInfoResponse == productInfoResponse) &&
            (identical(other.isGettingProductData, isGettingProductData) ||
                other.isGettingProductData == isGettingProductData) &&
            (identical(other.isGotProductData, isGotProductData) ||
                other.isGotProductData == isGotProductData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productInfoResponse, isGettingProductData, isGotProductData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class Initial implements ServicesState {
  const factory Initial(
      {final ProductInfoResponse? productInfoResponse,
      final bool isGettingProductData,
      final bool isGotProductData}) = _$InitialImpl;

  @override
  ProductInfoResponse? get productInfoResponse;
  @override
  bool get isGettingProductData;
  @override
  bool get isGotProductData;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'star_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StarState {
  List<OrderItem>? get orderItem => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get filter1 => throw _privateConstructorUsedError;
  bool get filter2 => throw _privateConstructorUsedError;
  bool get filter3 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarStateCopyWith<StarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarStateCopyWith<$Res> {
  factory $StarStateCopyWith(StarState value, $Res Function(StarState) then) =
      _$StarStateCopyWithImpl<$Res, StarState>;
  @useResult
  $Res call(
      {List<OrderItem>? orderItem,
      String value,
      bool filter1,
      bool filter2,
      bool filter3});
}

/// @nodoc
class _$StarStateCopyWithImpl<$Res, $Val extends StarState>
    implements $StarStateCopyWith<$Res> {
  _$StarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = freezed,
    Object? value = null,
    Object? filter1 = null,
    Object? filter2 = null,
    Object? filter3 = null,
  }) {
    return _then(_value.copyWith(
      orderItem: freezed == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      filter1: null == filter1
          ? _value.filter1
          : filter1 // ignore: cast_nullable_to_non_nullable
              as bool,
      filter2: null == filter2
          ? _value.filter2
          : filter2 // ignore: cast_nullable_to_non_nullable
              as bool,
      filter3: null == filter3
          ? _value.filter3
          : filter3 // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $StarStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderItem>? orderItem,
      String value,
      bool filter1,
      bool filter2,
      bool filter3});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StarStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderItem = freezed,
    Object? value = null,
    Object? filter1 = null,
    Object? filter2 = null,
    Object? filter3 = null,
  }) {
    return _then(_$InitialImpl(
      orderItem: freezed == orderItem
          ? _value._orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      filter1: null == filter1
          ? _value.filter1
          : filter1 // ignore: cast_nullable_to_non_nullable
              as bool,
      filter2: null == filter2
          ? _value.filter2
          : filter2 // ignore: cast_nullable_to_non_nullable
              as bool,
      filter3: null == filter3
          ? _value.filter3
          : filter3 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {final List<OrderItem>? orderItem = const [],
      this.value = '',
      this.filter1 = false,
      this.filter2 = false,
      this.filter3 = false})
      : _orderItem = orderItem;

  final List<OrderItem>? _orderItem;
  @override
  @JsonKey()
  List<OrderItem>? get orderItem {
    final value = _orderItem;
    if (value == null) return null;
    if (_orderItem is EqualUnmodifiableListView) return _orderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool filter1;
  @override
  @JsonKey()
  final bool filter2;
  @override
  @JsonKey()
  final bool filter3;

  @override
  String toString() {
    return 'StarState(orderItem: $orderItem, value: $value, filter1: $filter1, filter2: $filter2, filter3: $filter3)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._orderItem, _orderItem) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.filter1, filter1) || other.filter1 == filter1) &&
            (identical(other.filter2, filter2) || other.filter2 == filter2) &&
            (identical(other.filter3, filter3) || other.filter3 == filter3));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orderItem),
      value,
      filter1,
      filter2,
      filter3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class Initial implements StarState {
  const factory Initial(
      {final List<OrderItem>? orderItem,
      final String value,
      final bool filter1,
      final bool filter2,
      final bool filter3}) = _$InitialImpl;

  @override
  List<OrderItem>? get orderItem;
  @override
  String get value;
  @override
  bool get filter1;
  @override
  bool get filter2;
  @override
  bool get filter3;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pharm_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PharmInfoState {
  PharmInfoResponse? get pharmInfoResponse =>
      throw _privateConstructorUsedError;
  List<GetRegionListResponse?> get getRegionListResponse =>
      throw _privateConstructorUsedError;
  ProfileDataResponse? get profileDataResponse =>
      throw _privateConstructorUsedError;
  StatusCountOutsideResponse? get statusCountOutsideResponse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PharmInfoStateCopyWith<PharmInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PharmInfoStateCopyWith<$Res> {
  factory $PharmInfoStateCopyWith(
          PharmInfoState value, $Res Function(PharmInfoState) then) =
      _$PharmInfoStateCopyWithImpl<$Res, PharmInfoState>;
  @useResult
  $Res call(
      {PharmInfoResponse? pharmInfoResponse,
      List<GetRegionListResponse?> getRegionListResponse,
      ProfileDataResponse? profileDataResponse,
      StatusCountOutsideResponse? statusCountOutsideResponse});
}

/// @nodoc
class _$PharmInfoStateCopyWithImpl<$Res, $Val extends PharmInfoState>
    implements $PharmInfoStateCopyWith<$Res> {
  _$PharmInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmInfoResponse = freezed,
    Object? getRegionListResponse = null,
    Object? profileDataResponse = freezed,
    Object? statusCountOutsideResponse = freezed,
  }) {
    return _then(_value.copyWith(
      pharmInfoResponse: freezed == pharmInfoResponse
          ? _value.pharmInfoResponse
          : pharmInfoResponse // ignore: cast_nullable_to_non_nullable
              as PharmInfoResponse?,
      getRegionListResponse: null == getRegionListResponse
          ? _value.getRegionListResponse
          : getRegionListResponse // ignore: cast_nullable_to_non_nullable
              as List<GetRegionListResponse?>,
      profileDataResponse: freezed == profileDataResponse
          ? _value.profileDataResponse
          : profileDataResponse // ignore: cast_nullable_to_non_nullable
              as ProfileDataResponse?,
      statusCountOutsideResponse: freezed == statusCountOutsideResponse
          ? _value.statusCountOutsideResponse
          : statusCountOutsideResponse // ignore: cast_nullable_to_non_nullable
              as StatusCountOutsideResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PharmInfoStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PharmInfoResponse? pharmInfoResponse,
      List<GetRegionListResponse?> getRegionListResponse,
      ProfileDataResponse? profileDataResponse,
      StatusCountOutsideResponse? statusCountOutsideResponse});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PharmInfoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmInfoResponse = freezed,
    Object? getRegionListResponse = null,
    Object? profileDataResponse = freezed,
    Object? statusCountOutsideResponse = freezed,
  }) {
    return _then(_$InitialImpl(
      pharmInfoResponse: freezed == pharmInfoResponse
          ? _value.pharmInfoResponse
          : pharmInfoResponse // ignore: cast_nullable_to_non_nullable
              as PharmInfoResponse?,
      getRegionListResponse: null == getRegionListResponse
          ? _value._getRegionListResponse
          : getRegionListResponse // ignore: cast_nullable_to_non_nullable
              as List<GetRegionListResponse?>,
      profileDataResponse: freezed == profileDataResponse
          ? _value.profileDataResponse
          : profileDataResponse // ignore: cast_nullable_to_non_nullable
              as ProfileDataResponse?,
      statusCountOutsideResponse: freezed == statusCountOutsideResponse
          ? _value.statusCountOutsideResponse
          : statusCountOutsideResponse // ignore: cast_nullable_to_non_nullable
              as StatusCountOutsideResponse?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {this.pharmInfoResponse,
      final List<GetRegionListResponse?> getRegionListResponse = const [],
      this.profileDataResponse,
      this.statusCountOutsideResponse})
      : _getRegionListResponse = getRegionListResponse;

  @override
  final PharmInfoResponse? pharmInfoResponse;
  final List<GetRegionListResponse?> _getRegionListResponse;
  @override
  @JsonKey()
  List<GetRegionListResponse?> get getRegionListResponse {
    if (_getRegionListResponse is EqualUnmodifiableListView)
      return _getRegionListResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_getRegionListResponse);
  }

  @override
  final ProfileDataResponse? profileDataResponse;
  @override
  final StatusCountOutsideResponse? statusCountOutsideResponse;

  @override
  String toString() {
    return 'PharmInfoState(pharmInfoResponse: $pharmInfoResponse, getRegionListResponse: $getRegionListResponse, profileDataResponse: $profileDataResponse, statusCountOutsideResponse: $statusCountOutsideResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.pharmInfoResponse, pharmInfoResponse) ||
                other.pharmInfoResponse == pharmInfoResponse) &&
            const DeepCollectionEquality()
                .equals(other._getRegionListResponse, _getRegionListResponse) &&
            (identical(other.profileDataResponse, profileDataResponse) ||
                other.profileDataResponse == profileDataResponse) &&
            (identical(other.statusCountOutsideResponse,
                    statusCountOutsideResponse) ||
                other.statusCountOutsideResponse ==
                    statusCountOutsideResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pharmInfoResponse,
      const DeepCollectionEquality().hash(_getRegionListResponse),
      profileDataResponse,
      statusCountOutsideResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class Initial implements PharmInfoState {
  const factory Initial(
          {final PharmInfoResponse? pharmInfoResponse,
          final List<GetRegionListResponse?> getRegionListResponse,
          final ProfileDataResponse? profileDataResponse,
          final StatusCountOutsideResponse? statusCountOutsideResponse}) =
      _$InitialImpl;

  @override
  PharmInfoResponse? get pharmInfoResponse;
  @override
  List<GetRegionListResponse?> get getRegionListResponse;
  @override
  ProfileDataResponse? get profileDataResponse;
  @override
  StatusCountOutsideResponse? get statusCountOutsideResponse;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

part of 'star_bloc.dart';

@freezed
class StarState with _$StarState{
  const factory StarState({
    @ Default([])List<OrderItem>? orderItem,
    @Default('')String value,
    @Default(false)bool filter1,
    @Default(false)bool filter2,
    @Default(false)bool filter3,
}) = Initial;
}
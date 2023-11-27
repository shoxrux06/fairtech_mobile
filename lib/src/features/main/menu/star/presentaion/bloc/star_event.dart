part of 'star_bloc.dart';

@immutable
abstract class StarEvent {}

class SubmitFilterEvent extends StarEvent {
  final bool filter1;
  final bool filter2;
  final bool filter3;

  final String value;

  SubmitFilterEvent(this.filter1, this.filter2, this.filter3, {required this.value});
}

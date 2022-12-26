part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

class CounterLoading extends CounterState {}

class CounterLoaded extends CounterState {
  final int counterValue;

  const CounterLoaded({required this.counterValue});

  @override
  List<Object?> get props => [counterValue];
}

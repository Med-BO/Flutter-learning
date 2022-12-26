part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class InitializeCounter extends CounterEvent {
  const InitializeCounter();

  @override
  List<Object?> get props => [];
}

class IncrementCounter extends CounterEvent {
  const IncrementCounter();

  @override
  List<Object?> get props => [];
}

class DecrementCounter extends CounterEvent {
  const DecrementCounter();

  @override
  List<Object?> get props => [];
}

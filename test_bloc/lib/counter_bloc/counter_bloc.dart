import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterLoading()) {
    on<IncrementCounter>(_onIncrementCounter);
    on<DecrementCounter>(_onDecrementCounter);
    on<InitializeCounter>(_onInitializeCounter);
  }

  void _onInitializeCounter(
      InitializeCounter event, Emitter<CounterState> emit) {
    final state = this.state;
    if (state is CounterLoading) {
      emit(
        const CounterLoaded(
          counterValue: 0,
        ),
      );
    }
  }

  void _onIncrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    final state = this.state;
    if (state is CounterLoaded) {
      int counterValue = state.counterValue;
      counterValue++;
      emit(
        CounterLoaded(
          counterValue: counterValue,
        ),
      );
    }
  }

  void _onDecrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    final state = this.state;
    if (state is CounterLoaded) {
      int counterValue = state.counterValue;
      counterValue--;
      emit(
        CounterLoaded(
          counterValue: counterValue,
        ),
      );
    }
  }
}

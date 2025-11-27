import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/events/counter_events.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/states/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      final current = state.value;
      final next = current + 1;
      emit(CounterState(next));
    });

    on<DecrementEvent>((event, emit) {
      final current = state.value;
      final next = current - 1;
      emit(CounterState(next));
    });

    on<ResetEvent>((event, emit) {
      emit(CounterState(0));
    });
  }
}

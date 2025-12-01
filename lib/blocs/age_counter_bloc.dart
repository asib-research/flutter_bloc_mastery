import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/events/age_counter_event.dart';

class AgeCounterBloc extends Bloc<AgeCounterEvent, int>{
  AgeCounterBloc(): super(0){
    on<AgeCounterIncrementEvent>((event, emit)=> emit(state + 1));
    on<AgeCounterDecrementEvent>((event, emit)=> emit(state - 1));
    on<AgeCounterResetEvent>((event, emit)=> emit(0));
  }
}
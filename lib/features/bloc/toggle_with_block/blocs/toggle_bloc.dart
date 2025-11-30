import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/toggle_with_block/events/toggle_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/toggle_with_block/states/toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleState(false)) {
    on<ToggleSwitchEvent>((event, emit) {
      final current = state.isOn;
      emit(ToggleState(!current));
    });
  }
}

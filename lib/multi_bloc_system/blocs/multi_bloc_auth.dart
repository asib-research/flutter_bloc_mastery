import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/events/multi_bloc_auth_event.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/states/multi_bloc_auth_state.dart';

class MultiBlocAuth extends Bloc<MultiBlocAuthEvent, MultiBlocAuthState> {
  MultiBlocAuth() : super(MultiBlocAuthInitial()) {
    on<MultiBlocLoginEvent>((event, emit) async {
      emit(MultiBlocAuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(MultiBlocAuthSuccess(token: "abcd1234"));
    });

    on<MultiBlocLogoutEvent>((event, emit) async {
      emit(MultiBlocAuthLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(MultiBlocAuthInitial());
    });
  }
}

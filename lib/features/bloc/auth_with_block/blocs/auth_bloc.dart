import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/events/auth_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());

      await Future.delayed(const Duration(seconds: 2));

      if (event.username == "admin" && event.password == "1234") {
        emit(AuthAuthenticatedState(username: event.username));
      } else {
        emit(AuthErrorState(message: "Invalid username or password"));
      }
    });

    on<LogoutEvent>((event, emit) {
      emit(AuthInitialState());
    });
  }
}
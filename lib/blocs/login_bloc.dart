import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/events/login_event.dart';
import 'package:flutter_bloc_mastery/states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      if (state.email.isEmpty || state.password.isEmpty) {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            errorMessage: "Fields cannot be empty",
          ),
        );
        return;
      }

      emit(state.copyWith(status: LoginStatus.loading));

      await Future.delayed(const Duration(seconds: 2));

      if (state.email == "test@bloc.com" && state.password == "123456") {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            errorMessage: "Invalid email or password",
          ),
        );
      }
    });
  }
}

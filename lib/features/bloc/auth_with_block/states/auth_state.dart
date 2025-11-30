abstract class AuthState {}

class AuthInitialState implements AuthState {}

class AuthLoadingState implements AuthState {}

class AuthAuthenticatedState implements AuthState {
  final String username;

  AuthAuthenticatedState({required this.username});
}

class AuthErrorState implements AuthState {
  final String message;

  AuthErrorState({required this.message});
}

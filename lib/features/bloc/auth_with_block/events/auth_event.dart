abstract class AuthEvent {}

class LoginEvent implements AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}


class LogoutEvent implements AuthEvent{}
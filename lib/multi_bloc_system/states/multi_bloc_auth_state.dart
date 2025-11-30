abstract class MultiBlocAuthState {}

class MultiBlocAuthInitial extends MultiBlocAuthState {}

class MultiBlocAuthLoading extends MultiBlocAuthState {}

class MultiBlocAuthSuccess extends MultiBlocAuthState {
  final String token;

  MultiBlocAuthSuccess({required this.token});
}

class MultiBlocAuthFailure {
  final String error;

  MultiBlocAuthFailure({required this.error});
}

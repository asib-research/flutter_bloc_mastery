abstract class MultiBlocProfileState {}

class MultiBlocProfileInitial extends MultiBlocProfileState {}

class MultiBlocProfileLoading extends MultiBlocProfileState {}

class MultiBlocProfileLoaded extends MultiBlocProfileState {
  final String name;
  final String email;
  MultiBlocProfileLoaded({required this.name, required this.email});
}

class MultiBlocProfileFailure extends MultiBlocProfileState {
  final String error;
  MultiBlocProfileFailure({required this.error});
}

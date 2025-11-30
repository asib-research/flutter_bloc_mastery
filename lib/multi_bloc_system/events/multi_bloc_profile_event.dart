abstract class MultiBlocProfileEvent{}

class MultiBlocFetchProfileEvent extends MultiBlocProfileEvent{
  final String token;
  MultiBlocFetchProfileEvent({required this.token});
}
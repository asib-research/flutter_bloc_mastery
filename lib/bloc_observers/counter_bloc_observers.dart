import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObservers extends BlocObserver{

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print("=== Bloc Transition ===");
    print("Bloc: ${bloc.state.runtimeType}");
    print("Current State: ${transition.currentState}");
    print("Event: ${transition.event}");
    print("Next State: ${transition.nextState}");
    print("=================");
  }

}
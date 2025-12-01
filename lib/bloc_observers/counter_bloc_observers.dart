import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocObservers extends BlocObserver{

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print("=== Transition ===");
    print("Bloc: ${bloc.runtimeType}");
    print("Current State: ${transition.currentState}");
    print("Event: ${transition.event.runtimeType}");
    print("Next State: ${transition.nextState}");
    print("===================");
  }

}
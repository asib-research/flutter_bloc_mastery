import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/bloc_observers/counter_bloc_observers.dart';
import 'app/bloc_transition_app.dart';

void main() {
  Bloc.observer = AppBlocObservers();
  runApp(BlocTransitionApp());
}

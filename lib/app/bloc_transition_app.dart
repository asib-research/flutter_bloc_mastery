import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/blocs/age_counter_bloc.dart';
import 'package:flutter_bloc_mastery/blocs/counter_bloc.dart';
import 'package:flutter_bloc_mastery/screens/home_screen.dart';

class BlocTransitionApp extends StatelessWidget {
  const BlocTransitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => AgeCounterBloc()),
      ],
      child: MaterialApp(home: HomeScreen()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/cubits/counter_cubit.dart';
import 'package:flutter_bloc_mastery/screens/counter_screen.dart';

class FlutterBlocMastery extends StatelessWidget {
  const FlutterBlocMastery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => CounterCubit(), child: CounterScreen()),
    );
  }
}

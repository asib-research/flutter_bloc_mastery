import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/cubits/counter_cubit.dart';
import 'package:flutter_bloc_mastery/cubits/profile_cubit.dart';
import 'package:flutter_bloc_mastery/cubits/toggle_cubit.dart';
import 'package:flutter_bloc_mastery/features/bloc/auth_with_block/blocs/auth_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/blocs/counter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/blocs/fruit_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/repositories/fruit_repository.dart';
import 'package:flutter_bloc_mastery/features/bloc/toggle_with_block/blocs/toggle_bloc.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/blocs/multi_bloc_auth.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/blocs/multi_bloc_profile.dart';
import 'package:flutter_bloc_mastery/screens/home_screen.dart';
import 'package:flutter_bloc_mastery/cubits/items_cubit.dart';

class FlutterBlocMastery extends StatelessWidget {
  const FlutterBlocMastery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=> CounterCubit()),
      BlocProvider(create: (_)=> ProfileCubit()),
      BlocProvider(create: (_)=> ToggleCubit()),
      BlocProvider(create: (_)=> ItemsCubit()..fetchItems()),
      BlocProvider(create: (_)=> CounterBloc()),
      BlocProvider(create: (_)=> ToggleBloc()),
      BlocProvider(create: (_)=> AuthBloc()),
      BlocProvider(create: (_)=> FruitBloc(FruitRepository())),
      BlocProvider(create: (_)=> MultiBlocAuth(),),
      BlocProvider(create: (_)=> MultiBlocProfile(),),
    ], child: MaterialApp(
      home: HomeScreen(),
    ));
    // return MaterialApp(
    //   home: BlocProvider(create: (_)=> CounterCubit(), child: CounterScreen(),),
    // );
  }
}

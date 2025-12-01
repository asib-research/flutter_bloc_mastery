import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/blocs/login_bloc.dart';
import 'package:flutter_bloc_mastery/screens/login_screen.dart';

class BlocAuthApp extends StatelessWidget {
  const BlocAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => LoginBloc(), child: MaterialApp(home:  LoginScreen(),));
  }
}

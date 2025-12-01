import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/app_bloc_observation.dart';
import 'app/bloc_auth_app.dart';

void main() {
  Bloc.observer = AppBlocObservation();
  runApp(BlocAuthApp());
}

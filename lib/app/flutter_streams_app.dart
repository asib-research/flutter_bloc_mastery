import 'package:flutter/material.dart';
import 'package:flutter_bloc_mastery/screens/home_screen.dart';

class FlutterStreamsApp extends StatelessWidget {
  const FlutterStreamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

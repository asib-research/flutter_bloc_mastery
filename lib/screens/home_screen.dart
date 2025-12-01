import 'package:flutter/material.dart';
import 'package:flutter_bloc_mastery/screens/age_counter_screen.dart';
import 'package:flutter_bloc_mastery/screens/counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Transition"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterScreen()));
            }, child: Text("Counter Screen")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AgeCounterScreen()));
            }, child: Text("Age Counter Screen")),
          ],
        ),
      ),
    );
  }
}

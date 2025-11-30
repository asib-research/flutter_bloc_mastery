import 'package:flutter/material.dart';
import 'package:flutter_bloc_mastery/features/bloc/auth_with_block/screens/bloc_auth_screen.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/screens/bloc_counter_screen.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/screens/bloc_fruit_screen.dart';
import 'package:flutter_bloc_mastery/features/bloc/toggle_with_block/screens/bloc_toggle_screen.dart';
import 'package:flutter_bloc_mastery/features/fruites/presentations/screens/fruits_screen.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/screens/multi_bloc_screen.dart';
import 'package:flutter_bloc_mastery/screens/counter_screen.dart';
import 'package:flutter_bloc_mastery/screens/items_screen.dart';
import 'package:flutter_bloc_mastery/screens/profile_screen.dart';
import 'package:flutter_bloc_mastery/screens/toggle_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterScreen()));
            }, child: Text("Counter Screen")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
            }, child: Text("Profile Screen")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ToggleScreen()));
            }, child: Text("Toggle Screen")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsScreen()));
            }, child: Text("Items Screen")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FruitsScreen()));
            }, child: Text("Fruits Screen")),

         ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocCounterScreen()));
            }, child: Text("Bloc Counter Screen")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocToggleScreen()));
            }, child: Text("Bloc Toggle Screen")),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocAuthScreen()));
            }, child: Text("Bloc Auth Screen")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocFruitScreen()));
            }, child: Text("Bloc Fruits Screen")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MultiBlocScreen()));
            }, child: Text("Multi Bloc Screen")),

          ],
        ),
      ),
    );
  }
}

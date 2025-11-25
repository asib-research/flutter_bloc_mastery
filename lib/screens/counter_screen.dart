import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/cubits/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, number) {
                return Text(
                  "$number",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 48,
                  ),
                );
              },
            ),

            SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: (){
                  context.read<CounterCubit>().increase();
                }, child: Icon(Icons.add),),
                SizedBox(width: 16,),
                FloatingActionButton(onPressed: (){
                  context.read<CounterCubit>().decrease();
                }, child: Icon(Icons.remove),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

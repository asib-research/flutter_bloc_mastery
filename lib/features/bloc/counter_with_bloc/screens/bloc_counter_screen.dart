import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/blocs/counter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/events/counter_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/states/counter_state.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Counter Screen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "${state.value}",
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
                FloatingActionButton(
                  heroTag: "1",
                  onPressed: (){
                  context.read<CounterBloc>().add(IncrementEvent());
                }, child: Icon(Icons.add),),
                SizedBox(width: 16,),
                FloatingActionButton(
                  heroTag: "2",
                  onPressed: (){
                  context.read<CounterBloc>().add(ResetEvent());
                }, child: Icon(Icons.refresh),),
                SizedBox(width: 16,),
                FloatingActionButton(
                  heroTag: "3",
                  onPressed: (){
                  context.read<CounterBloc>().add(DecrementEvent());
                }, child: Icon(Icons.remove),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

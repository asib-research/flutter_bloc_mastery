import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/blocs/counter_bloc.dart';
import 'package:flutter_bloc_mastery/events/counter_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLoC Transition")),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "inc",
            child: const Icon(Icons.add),
            onPressed: () =>
                context.read<CounterBloc>().add(IncrementEvent()),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "dec",
            child: const Icon(Icons.remove),
            onPressed: () =>
                context.read<CounterBloc>().add(DecrementEvent()),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "reset",
            child: const Icon(Icons.refresh),
            onPressed: () => context.read<CounterBloc>().add(ResetEvent()),
          ),
        ],
      ),
    );
  }
}

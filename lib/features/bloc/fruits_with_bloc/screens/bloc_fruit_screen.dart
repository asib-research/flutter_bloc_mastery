import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/blocs/fruit_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/events/fruit_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/models/fruit_model.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/states/fruit_state.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruit Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: BlocBuilder<FruitBloc, FruitState>(
            //     builder: (context, state) {
            //       if (state is FruitsInitial) {
            //         return const Text("Press button to fetch fruits");
            //       }
            //       if (state is FruitsLoading) {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //       if (state is FruitsLoaded) {
            //         return ListView.builder(
            //           itemCount: state.fruits.length,
            //           itemBuilder: (context, index) {
            //             Fruit fruit = state.fruits[index];
            //             return ListTile(
            //               title: Text(fruit.name),
            //               subtitle: Text(fruit.color),
            //             );
            //           },
            //         );
            //       }
            //       if (state is FruitsError) {
            //         return Text(state.message, style: const TextStyle(color: Colors.red));
            //       }
            //       return const SizedBox();
            //     },
            //   ),
            // ),
            //
            Expanded(
              child: BlocBuilder<FruitBloc, FruitState>(
                builder: (context, state) {
                  if (state is FruitsInitial) {
                    return Center(
                      child: const Text("Press button to fetch fruits"),
                    );
                  }

                  if (state is FruitsLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is FruitsLoaded) {
                    return ListView.builder(
                      itemCount: state.fruits.length,
                      itemBuilder: (context, index) {
                        final Fruit fruit = state.fruits[index];
                        return ListTile(
                          title: Text(fruit.name),
                          subtitle: Text(fruit.color),
                        );
                      },
                    );
                  }

                  return SizedBox();
                },
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<FruitBloc>().add(FetchFruitsEvent());
              },
              child: const Text("Fetch Fruits"),
            ),
          ],
        ),
      ),
    );
  }
}

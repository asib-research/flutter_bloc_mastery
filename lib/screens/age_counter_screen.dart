import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/blocs/age_counter_bloc.dart';
import 'package:flutter_bloc_mastery/events/age_counter_event.dart';

class AgeCounterScreen extends StatelessWidget {
  const AgeCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Age Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AgeCounterBloc, int>(
              builder: (context, state) {
                return Text(
                  "Count: $state",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                );
              },
            ),

            BlocListener<AgeCounterBloc, int>(
              listener: (context, state) {
                if (state == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("We find the 5 years old person")),
                  );
                }
              },
              child: SizedBox.shrink(),
            ),

            BlocConsumer<AgeCounterBloc, int>(
              builder: (context, state) {
                return Text(
                  "Count Value: ${context.watch<AgeCounterBloc>().state}",
                );
              },
              listener: (context, state) {
                if (state == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("We find the 10 years old person")),
                  );
                }
              },
            ),

            Text("Bloc State Count: ${context.watch<AgeCounterBloc>().state}"),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<AgeCounterBloc>().add(
                      AgeCounterIncrementEvent(),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AgeCounterBloc>().add(AgeCounterResetEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AgeCounterBloc>().add(
                      AgeCounterDecrementEvent(),
                    );
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

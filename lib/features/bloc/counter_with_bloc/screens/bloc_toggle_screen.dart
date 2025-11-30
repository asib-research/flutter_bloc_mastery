import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/blocs/toggle_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/events/toggle_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/counter_with_bloc/states/toggle_state.dart';

class BlocToggleScreen extends StatelessWidget {
  const BlocToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toggle Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<ToggleBloc, ToggleState>(
              builder: (context, state) {
                return Container(
                  height: 100,
                  width: 100,
                  color: state.isOn ? Colors.green : Colors.grey,
                );
              },
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ToggleBloc>().add(ToggleSwitchEvent());
                  },
                  child: Text("Light Swtich"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

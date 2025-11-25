import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/cubits/toggle_cubit.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle Screen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ToggleCubit, bool>(builder: (context, on){
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: on ? Colors.white : Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                        blurRadius: 8,
                        spreadRadius: 8,
                        offset: Offset(5, 1)
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(on ? "Light Off" : "Light On"),
              );
            }),
SizedBox(height: 24,),
            ElevatedButton(onPressed: (){
              context.read<ToggleCubit>().toggle();
            }, child: Text("Tap Switch")),
          ],
        ),
      ),
    );
  }
}

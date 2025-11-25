import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/fruites/data/repositories/fruits_repository.dart';
import 'package:flutter_bloc_mastery/features/fruites/presentations/cubit/fruits_cubit.dart';
import 'package:flutter_bloc_mastery/features/fruites/presentations/cubit_states/fruits_state.dart';


class FruitsScreen extends StatelessWidget {
  const FruitsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FruitsCubit(FruitsRepository())..loadFruits(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Fruits Screen')),
        body: BlocBuilder<FruitsCubit, FruitsState>(
          builder: (context, st) {
            if (st.loading) return const Center(child: CircularProgressIndicator());
            if (st.error != null) return Center(child: Text(st.error!));
            return ListView(
              padding: const EdgeInsets.all(12),
              children: st.fruits.map((f) => Card(child: Padding(
                  padding: const EdgeInsets.all(12), child: Text(f)
              ))).toList(),
            );
          },
        ),
      ),
    );
  }
}

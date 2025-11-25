import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/models/load_state.dart';
import 'package:flutter_bloc_mastery/cubits/items_cubit.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<ItemsCubit, LoadState<List<String>>>(
            builder: (context, state) {
              if (state.loading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.error != null) {
                return Center(child: Text(state.error!));
              }

              final data = state.data ?? [];
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index)=> Text(data[index]));

              // return ListView(
              //   children: state.data!.map((e) => ListTile(title: Text(e))).toList(),
              // );
            },
          ),
        ),
      ),
    );
  }
}

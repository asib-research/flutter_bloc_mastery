import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/cubits/profile_cubit.dart';
import 'package:flutter_bloc_mastery/models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProfileCubit, ProfileModel>(
              builder: (context, profileModel) {
                return Text(
                  "Name: ${profileModel.name}",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                );
              },
            ),
            BlocBuilder<ProfileCubit, ProfileModel>(
              builder: (context, profileModel) {
                return Text(
                  "Age: ${profileModel.age}",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                );
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    context.read<ProfileCubit>().setName(name: "Samy");
                  },
                  child: Icon(Icons.person_outline),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    context.read<ProfileCubit>().haveBirthday();
                  },
                  child: Icon(Icons.event_available),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/blocs/multi_bloc_auth.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/blocs/multi_bloc_profile.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/events/multi_bloc_auth_event.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/events/multi_bloc_profile_event.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/states/multi_bloc_auth_state.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/states/multi_block_profile_state.dart';

class MultiBlocScreen extends StatelessWidget {
  const MultiBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multi-BLoC System")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocListener<MultiBlocAuth, MultiBlocAuthState>(
            //   listener: (context, state) {
            //     if (state is MultiBlocAuthSuccess) {
            //       context.read<MultiBlocProfile>().add(
            //         MultiBlocFetchProfileEvent(token: state.token),
            //       );
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text("Login Success! Fetching Profile..."),
            //         ),
            //       );
            //     }
            //   },
            //   child: const SizedBox.shrink(),
            // ),
            BlocListener<MultiBlocAuth, MultiBlocAuthState>(
              listener: (context, state) {
                if (state is MultiBlocAuthSuccess) {
                  context.read<MultiBlocProfile>().add(
                    MultiBlocFetchProfileEvent(token: state.token),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success! Fetching Profile...")));
                }
              },
              child: const SizedBox.shrink(),
            ),

            BlocBuilder<MultiBlocAuth, MultiBlocAuthState>(
              builder: (context, state) {
                if (state is MultiBlocAuthLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is MultiBlocAuthInitial) {
                  return ElevatedButton(
                    onPressed: () => context.read<MultiBlocAuth>().add(
                      MultiBlocLoginEvent(),
                    ),
                    child: const Text("Login"),
                  );
                }
                if (state is MultiBlocAuthSuccess) {
                  return ElevatedButton(
                    onPressed: () => context.read<MultiBlocAuth>().add(
                      MultiBlocLogoutEvent(),
                    ),
                    child: const Text("Logout"),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            const SizedBox(height: 20),

            BlocBuilder<MultiBlocProfile, MultiBlocProfileState>(
              builder: (context, state) {
                if (state is MultiBlocProfileLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is MultiBlocProfileLoaded) {
                  return Text(
                    "Name: ${state.name}\nEmail: ${state.email}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  );
                }
                return const Text("Profile not loaded");
              },
            ),
          ],
        ),
      ),
    );
  }
}

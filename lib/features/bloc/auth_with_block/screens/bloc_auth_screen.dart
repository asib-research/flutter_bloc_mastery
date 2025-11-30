import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/auth_with_block/blocs/auth_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/auth_with_block/events/auth_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/auth_with_block/states/auth_state.dart';

class BlocAuthScreen extends StatefulWidget {
  const BlocAuthScreen({super.key});

  @override
  State<BlocAuthScreen> createState() => _AuthPageState();
}

class _AuthPageState extends State<BlocAuthScreen> {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth Screen")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthAuthenticatedState) {
            return _buildHomeUI(context, state.username);
          }

          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return _buildLoginForm(context);
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameC,
            decoration: const InputDecoration(labelText: "Username"),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: passwordC,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                LoginEvent(
                  username: usernameC.text.trim(),
                  password: passwordC.text.trim(),
                ),
              );
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeUI(BuildContext context, String username) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Welcome, $username!",
              style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }
}

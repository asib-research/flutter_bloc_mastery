import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/blocs/login_bloc.dart';
import 'package:flutter_bloc_mastery/events/login_event.dart';
import 'package:flutter_bloc_mastery/states/login_state.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLoC Login Form")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login Successful! ✅")));
            } else if (state.status == LoginStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage ?? "Error")));
            }
          },
          child: Column(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextField(
                    decoration: const InputDecoration(labelText: "Email"),
                    onChanged: (value) =>
                        context.read<LoginBloc>().add(EmailChangedEvent(email: value)),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    onChanged: (value) => context
                        .read<LoginBloc>()
                        .add(PasswordChangedEvent(password: value)),
                  );
                },
              ),
              const SizedBox(height: 40),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return state.status == LoginStatus.loading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () =>
                        context.read<LoginBloc>().add(LoginSubmitted()),
                    child: const Text("Login"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

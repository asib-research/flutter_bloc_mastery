import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StreamController<int> _controller = StreamController<int>();
  int count = 0;

  void increment() {
    count++;
    _controller.add(count);
  }

  void decrement() {
    count--;
    _controller.add(count);
  }

  void refresh() {
    count = 0;
    _controller.add(count);
  }

  @override
  void initState() {
    super.initState();
    _controller.add(count);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _controller.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Text("Something went wrong!");
                }
                final data = snapshot.data ?? 0;

                return Text(
                  "Count: $data",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: increment, icon: const Icon(Icons.add)),
                IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
                IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

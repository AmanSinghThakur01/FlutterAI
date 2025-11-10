import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter AI ChatBot"),
      ),
      body: const Center(
        child: Text("App follows system dark/light mode"),
      ),
    );
  }
}

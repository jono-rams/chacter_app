import 'package:flutter/material.dart';
import 'package:chacter_app/screens/home/home.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Character Selection',
    home: Home(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('Sandbox'),
    );
  }
}



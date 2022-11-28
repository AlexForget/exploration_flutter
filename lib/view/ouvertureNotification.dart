import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key, required this.payload});

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affichage notification Paylaod'),
      ),
      body: Center(
        child: Text(
          payload,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

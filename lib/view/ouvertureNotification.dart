import 'package:flutter/material.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key, required this.payload});

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Affichage notification Paylaod'.hardcoded),
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

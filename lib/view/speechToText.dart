// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../Widget/drawerApp.dart';

class SpeechToText extends StatefulWidget {
  const SpeechToText({super.key});

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to text'),
      ),
      drawer: const DrawerApp(),
      body: const SafeArea(
        child: Text('test'),
      ),
    );
  }
}

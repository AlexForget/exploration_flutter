import 'package:flutter/material.dart';

import '../Widget/drawerApp.dart';

class AudioTest extends StatelessWidget {
  const AudioTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio'),
      ),
      drawer: const DrawerApp(),
    );
  }
}

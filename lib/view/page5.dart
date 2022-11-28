import 'package:flutter/material.dart';

import '../Widget/drawerApp.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 5'),
      ),
      drawer: const DrawerApp(),
    );
  }
}

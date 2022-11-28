import 'package:flutter/material.dart';
import 'package:premier_test/Widget/drawerApp.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      drawer: const DrawerApp(),
    );
  }
}

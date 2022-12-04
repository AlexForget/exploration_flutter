import 'package:flutter/material.dart';
import 'package:premier_test/view/connexion.dart';

import 'globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Connexion(titre: 'Bienvenue'),
    );
  }
}

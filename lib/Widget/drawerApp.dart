import 'package:flutter/material.dart';
import 'package:premier_test/view/audio.dart';
import 'package:premier_test/view/page4.dart';
import 'package:premier_test/view/page5.dart';

import '../view/accueil.dart';
import '../view/notifTest.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key, required this.titre});

  final String titre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text('En tête menu'),
            ),
            ListTile(
              title: const Text('Accueil'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Accueil()))
              },
            ),
            ListTile(
              title: const Text('Notification'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const NotifTest()))
              },
            ),
            ListTile(
              title: const Text('Audio'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const AudioTest()))
              },
            ),
            ListTile(
              title: const Text('Page 4'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Page4()))
              },
            ),
            ListTile(
              title: const Text('Page 5'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Page5()))
              },
            ),
          ],
        ),
      ),
    );
  }
}

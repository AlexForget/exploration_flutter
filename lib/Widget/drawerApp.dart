import 'package:flutter/material.dart';
import 'package:premier_test/view/audio.dart';
import 'package:premier_test/view/pushNotification.dart';
import 'package:premier_test/view/page5.dart';

import '../view/accueil.dart';
import '../view/notifTest.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            title: const Text('Push notification'),
            onTap: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const PushNotification()))
            },
          ),
          ListTile(
            title: const Text('Affichage notification Payload'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Page5()))
            },
          ),
        ],
      ),
    );
  }
}

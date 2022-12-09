import 'package:flutter/material.dart';
import 'package:premier_test/view/notifObjectifs.dart';
import 'package:premier_test/view/notifQuotidienne.dart';
import 'package:premier_test/view/notifRecurrente.dart';
import 'package:premier_test/view/audio.dart';
import 'package:premier_test/view/notifThematique.dart';

import '../view/notifChannel.dart';
import '../view/notifScheduled.dart';

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
            title: const Text('Notification channel'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const NotifChannel()))
            },
          ),
          ListTile(
            title: const Text('Notification programmé'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const NotifTest()))
            },
          ),
          ListTile(
            title: const Text('Notification récurrente'),
            onTap: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotifRecurrente()))
            },
          ),
          ListTile(
            title: const Text('Lecture fichier audio'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AudioTest()))
            },
          ),
          ListTile(
            title: const Text('Notification thématique'),
            onTap: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotificationThematique()))
            },
          ),
          ListTile(
            title: const Text('Notification objectifs'),
            onTap: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotificationObjectifs()))
            },
          ),
          ListTile(
            title: const Text('Notification quotidienne'),
            onTap: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NotificationQuotidienne()))
            },
          ),
        ],
      ),
    );
  }
}

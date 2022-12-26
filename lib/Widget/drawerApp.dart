import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/router/app_router.dart';

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
              onTap: () => context.goNamed(AppRouter.accueil.name)),
          ListTile(
              title: const Text('Lecture fichier audio'),
              onTap: () => context.goNamed(AppRouter.audio.name)),
          ListTile(
              title: const Text('Notification thématique'),
              onTap: () => context.goNamed(AppRouter.notifThematique.name)),
          ListTile(
              title: const Text('Notification objectifs'),
              onTap: () => context.goNamed(AppRouter.notifObjectif.name)),
          ListTile(
              title: const Text('Notification quotidienne'),
              onTap: () => context.goNamed(AppRouter.notifQuotidienne.name)),
          ListTile(
              title: const Text('Notification bilan hebdomadaire'),
              onTap: () => context.goNamed(AppRouter.notifBilan.name)),
          ListTile(
              title: const Text('Speech to text'),
              onTap: () => context.goNamed(AppRouter.speechToText.name)),
          ListTile(
              title: const Text('Navigation'),
              onTap: () => context.goNamed(AppRouter.localisation.name)),
        ],
      ),
    );
  }
}

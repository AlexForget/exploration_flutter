import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/app_localisations_context.dart';
import 'package:premier_test/router/app_router.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(context.loc.menuEnTete),
          ),
          ListTile(
              title: Text(context.loc.accueil),
              onTap: () => context.goNamed(AppRouter.accueil.name)),
          ListTile(
              title: Text(context.loc.lectureFichierAudio),
              onTap: () => context.goNamed(AppRouter.audio.name)),
          ListTile(
              title: Text(context.loc.notificationThematique),
              onTap: () => context.goNamed(AppRouter.notifThematique.name)),
          ListTile(
              title: Text(context.loc.notificationObjectifs),
              onTap: () => context.goNamed(AppRouter.notifObjectif.name)),
          ListTile(
              title: Text(context.loc.notificationQuotidienne),
              onTap: () => context.goNamed(AppRouter.notifQuotidienne.name)),
          ListTile(
              title: Text(context.loc.notificationBilanHebdo),
              onTap: () => context.goNamed(AppRouter.notifBilan.name)),
          ListTile(
              title: Text(context.loc.speechToText),
              onTap: () => context.goNamed(AppRouter.speechToText.name)),
          ListTile(
              title: Text(context.loc.navigation),
              onTap: () => context.goNamed(AppRouter.localisation.name)),
        ],
      ),
    );
  }
}

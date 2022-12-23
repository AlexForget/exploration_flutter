// ignore_for_file: unused_import

import 'package:go_router/go_router.dart';
import 'package:premier_test/view/accueil.dart';
import 'package:premier_test/view/audio.dart';
import 'package:premier_test/view/connexion.dart';
import 'package:premier_test/view/notifObjectifs.dart';
import 'package:premier_test/view/notifQuotidienne.dart';
import 'package:premier_test/view/notifThematique.dart';
import 'package:premier_test/view/notificationBilanHebdo.dart';
import 'package:premier_test/view/sousRoute.dart';
import 'package:premier_test/view/speechToText.dart';
import 'package:premier_test/view/testLocalisation.dart';

enum AppRouter {
  connexion,
  accueil,
  audio,
  notifThematique,
  notifObjectif,
  notifQuotidienne,
  notifBilan,
  speechToText,
  localisation,
  sousRouter,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.connexion.name,
      builder: (context, state) => const Connexion(),
      routes: [
        GoRoute(
          path: 'accueil',
          name: AppRouter.accueil.name,
          builder: (context, state) => const Accueil(),
        ),
        GoRoute(
          path: 'audio',
          name: AppRouter.audio.name,
          builder: (context, state) => const AudioTest(),
        ),
        GoRoute(
          path: 'notifThematique',
          name: AppRouter.notifThematique.name,
          builder: (context, state) => const NotificationThematique(),
        ),
        GoRoute(
          path: 'notifObjectif',
          name: AppRouter.notifObjectif.name,
          builder: (context, state) => const NotificationObjectifs(),
        ),
        GoRoute(
          path: 'notifQuotidienne',
          name: AppRouter.notifQuotidienne.name,
          builder: (context, state) => const NotificationQuotidienne(),
        ),
        GoRoute(
          path: 'notifBilan',
          name: AppRouter.notifBilan.name,
          builder: (context, state) => const NotificationBilanHendomadaire(),
        ),
        GoRoute(
          path: 'speechToText',
          name: AppRouter.speechToText.name,
          builder: (context, state) => const SpeechToTextPage(),
        ),
        GoRoute(
          path: 'localisation',
          name: AppRouter.localisation.name,
          builder: (context, state) => const TestLocalisation(),
          routes: [
            GoRoute(
              path: 'sousRouter',
              name: AppRouter.sousRouter.name,
              builder: (context, state) => const SousRoute(),
            ),
          ],
        ),
      ],
    ),
  ],
);

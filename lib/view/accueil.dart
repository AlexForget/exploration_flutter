// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:premier_test/services/local_notifications_service.dart';

import '../Widget/drawerApp.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late final LocalNotificationService service;

  String notifPending = '';

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    // listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      drawer: const DrawerApp(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: afficherPendingNotif,
                    child: const Text('Afficher les notifications en attentes'),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      service.cancelAll(),
                      afficherPendingNotif(),
                    },
                    child: const Text('Canceller toutes les notifications'),
                  ),
                  Text(notifPending),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void afficherPendingNotif() async {
    List<PendingNotificationRequest> pending =
        await service.pendingNotification();
    notifPending = '';

    setState(() {
      for (var notif in pending) {
        String? title = notif.title;
        String? body = notif.body;
        notifPending += '$title : $body \n\n';
      }
    });
  }
}

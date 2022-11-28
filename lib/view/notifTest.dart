// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:premier_test/services/local_notifications_service.dart';

import '../Widget/drawerApp.dart';

class NotifTest extends StatefulWidget {
  const NotifTest({super.key});

  @override
  State<NotifTest> createState() => _NotifTestState();
}

class _NotifTestState extends State<NotifTest> {
  late final LocalNotificationService service;

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
        title: const Text('Notification'),
      ),
      drawer: const DrawerApp(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Demonstration comment utiliser les notifications locales',
                    style: TextStyle(fontSize: 30),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showNotification(
                          id: 0,
                          title: 'Titre de la notification',
                          body: 'Corp de la notification');
                    },
                    child: const Text('Lancer une notification locale'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showScheduledNotification(
                          id: 0,
                          title: 'Titre de la notification',
                          body: 'Corp de la notification',
                          seconds: 5);
                    },
                    child: const Text(
                        'Lancer une notification locale dans 5 secondes'),
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Notification quotidienne'),
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text(
                        'Notification selon journées et heures choisis'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

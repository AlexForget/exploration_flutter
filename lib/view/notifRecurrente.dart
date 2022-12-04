// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:premier_test/services/local_notifications_service.dart';

import '../Widget/drawerApp.dart';

class NotifRecurrente extends StatefulWidget {
  const NotifRecurrente({super.key});

  @override
  State<NotifRecurrente> createState() => _NotifRecurrenteState();
}

class _NotifRecurrenteState extends State<NotifRecurrente> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification récurrente'),
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
                  const Text(
                    'Demonstration comment utiliser les notifications locales',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showScheduledNotification(
                          id: 4,
                          title: 'Notification récurrente',
                          body: 'Notification à toutes les minutes',
                          seconds: 5,
                          channelId: '4',
                          channelName: 'minute');
                    },
                    child: const Text(
                        'Lancer une notification locale à toutes les minutes'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.cancelNotification(notifId: 4);
                    },
                    child:
                        const Text('Annuler notification à toutes les minutes'),
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

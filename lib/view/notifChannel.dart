// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:premier_test/services/local_notifications_service.dart';

import '../Widget/drawerApp.dart';

class NotifChannel extends StatefulWidget {
  const NotifChannel({super.key});

  @override
  State<NotifChannel> createState() => _NotifChannelState();
}

class _NotifChannelState extends State<NotifChannel> {
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
        title: const Text('Notification channel'),
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
                      service.showNotification(
                          id: 0,
                          title: 'Réflexion',
                          body: 'Corp de la notification',
                          channelId: '1',
                          channelName: 'réflexion');
                    },
                    child: const Text('Channel = réflexion'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showNotification(
                          id: 1,
                          title: 'Objectifs',
                          body: 'Corp de la notification',
                          channelId: '2',
                          channelName: 'objectifs');
                    },
                    child: const Text('Channel = objectifs'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showNotification(
                          id: 2,
                          title: 'Thématiques',
                          body: 'Corp de la notification',
                          channelId: '3',
                          channelName: 'thématiques');
                    },
                    child: const Text('Channel = thématiques'),
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

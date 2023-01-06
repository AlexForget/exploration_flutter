// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:premier_test/l10n/app_localisations_context.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';
import 'package:premier_test/services/local_notifications_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../Widget/drawerApp.dart';

class NotificationQuotidienne extends StatefulWidget {
  const NotificationQuotidienne({super.key});

  @override
  State<NotificationQuotidienne> createState() =>
      _NotificationQuotidienneState();
}

class _NotificationQuotidienneState extends State<NotificationQuotidienne> {
  late final LocalNotificationService service;
  TimeOfDay time = const TimeOfDay(hour: 8, minute: 0);

  @override
  void initState() {
    tz.initializeTimeZones();
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  void creerNotificationQuotidienne(int heure, int minute) async {
    DateTime aujourdhui = DateTime.now();
    final local = tz.getLocation('America/Montreal');
    final notificationScheduled = tz.TZDateTime(local, aujourdhui.year,
        aujourdhui.month, aujourdhui.day, heure, minute);

    service.showNotificationQuotidienne(
      id: 100,
      title: context.loc.quotidienne,
      body: '${context.loc.notificationQuotidienne} $notificationScheduled',
      scheduledDate: notificationScheduled,
      channelId: '6',
      channelName: context.loc.quotidienne,
    );
  }

  @override
  Widget build(BuildContext context) {
    final heures = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    const fontSizeGrand = 28.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.notificationQuotidienne),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                );
                if (newTime == null) {
                  return;
                }
                setState(() {
                  time = newTime;
                });
              },
              child: Text(
                '$heures:$minutes',
                style: const TextStyle(fontSize: fontSizeGrand),
              ),
            ),
            ElevatedButton(
              onPressed: () => creerNotificationQuotidienne(
                  int.parse(heures), int.parse(minutes)),
              child: Text(context.loc.preparerNotification),
            ),
          ],
        ),
      ),
    );
  }
}

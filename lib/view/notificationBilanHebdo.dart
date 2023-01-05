// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:premier_test/Widget/drawerApp.dart';
import 'package:premier_test/l10n/app_localisations_context.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';
import 'package:premier_test/services/local_notifications_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationBilanHendomadaire extends StatefulWidget {
  const NotificationBilanHendomadaire({super.key});

  @override
  State<NotificationBilanHendomadaire> createState() =>
      _NotificationBilanHendomadaireState();
}

class _NotificationBilanHendomadaireState
    extends State<NotificationBilanHendomadaire> {
  late final LocalNotificationService notificationService;
  TimeOfDay heureNotification = const TimeOfDay(hour: 8, minute: 0);

  @override
  void initState() {
    notificationService = LocalNotificationService();
    notificationService.initialize();
    tz.initializeTimeZones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heures = heureNotification.hour.toString().padLeft(2, '0');
    final minutes = heureNotification.minute.toString().padLeft(2, '0');
    const fontSizePetit = 20.0;
    const fontSizeGrand = 28.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.notificationBilanHebdo),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                '$heures : $minutes',
                style: const TextStyle(fontSize: fontSizeGrand),
              ),
              onTap: () async {
                TimeOfDay? nouvelleHeure = await showTimePicker(
                  context: context,
                  initialTime: heureNotification,
                );
                if (nouvelleHeure == null) return;
                setState(() {
                  heureNotification = nouvelleHeure;
                });
              },
            ),
            ElevatedButton(
              onPressed: () =>
                  envoyerNotification(int.parse(heures), int.parse(minutes)),
              child: Text(
                context.loc.preparerNotification,
                style: const TextStyle(fontSize: fontSizePetit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void envoyerNotification(int heure, int minute) async {
    final local = tz.getLocation('America/Montreal');
    int idNotification = 300;

    DateTime dateNotification = DateTime.now();

    while (dateNotification.weekday != DateTime.sunday) {
      dateNotification = dateNotification.add(const Duration(days: 1));
    }

    final notificationScheduled = tz.TZDateTime(
      local,
      dateNotification.year,
      dateNotification.month,
      dateNotification.day,
      heure,
      minute,
    );

    notificationService.showNotificationHebdomadaire(
        id: idNotification++,
        title: 'Bilan hebdomadaire',
        body: 'Notification bilan hebdomadaire $notificationScheduled',
        scheduledDate: notificationScheduled,
        channelId: '4',
        channelName: 'bilan hebdomadaire');
  }
}

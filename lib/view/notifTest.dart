// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:premier_test/services/local_notifications_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../Widget/drawerApp.dart';

class NotifTest extends StatefulWidget {
  const NotifTest({super.key});

  @override
  State<NotifTest> createState() => _NotifTestState();
}

class _NotifTestState extends State<NotifTest> {
  late final LocalNotificationService service;
  TimeOfDay time = const TimeOfDay(hour: 9, minute: 30);
  DateTime date = DateTime.now().add(const Duration(days: 1));

  @override
  void initState() {
    tz.initializeTimeZones();
    service = LocalNotificationService();
    service.initialize();
    // listenToNotification();
    super.initState();
  }

  void selectionNotificationCedule(
      int year, int month, int day, int hour, int minute) async {
    final local = tz.getLocation('America/Montreal');
    final scheduledNotification =
        tz.TZDateTime(local, year, month, day, hour, minute, 0);

    service.showNotificationScheduled(
        id: 5,
        title: 'Notification mardi',
        body: 'Notification à un moment précis',
        scheduledDate: scheduledNotification,
        channelId: '5',
        channelName: 'Moment choisis');
  }

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final years = date.year;
    final months = date.month.toString().padLeft(2, '0');
    final days = date.day.toString().padLeft(2, '0');

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
                          title: 'Titre de la notification',
                          body: 'Corp de la notification',
                          channelId: '1',
                          channelName: 'réflexion');
                    },
                    child: const Text('Channel = réflexion'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showNotification(
                          id: 0,
                          title: 'Titre de la notification',
                          body: 'Corp de la notification',
                          channelId: '2',
                          channelName: 'objectifs');
                    },
                    child: const Text('Channel = objectifs'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showNotification(
                          id: 0,
                          title: 'Titre de la notification',
                          body: 'Corp de la notification',
                          channelId: '3',
                          channelName: 'thématiques');
                    },
                    child: const Text('Channel = thématiques'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      service.showScheduledNotification(
                          id: 4,
                          title: 'Notification mardi',
                          body:
                              'Notification de type quotidienne mais seulement affiché mardi',
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
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '$hours:$minutes',
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: time,
                      );

                      // si clique cancel
                      if (newTime == null) return;

                      // si clique ok
                      setState(() {
                        time = newTime;
                      });
                    },
                    child: const Text('Choisir l\'heure de la notification'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '$years/$months/$days',
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      // si clique cancel
                      if (newDate == null) return;

                      // si clique ok
                      setState(() {
                        date = newDate;
                      });
                    },
                    child: const Text('Choisir la date de la notification'),
                  ),
                  ElevatedButton(
                    onPressed: () => selectionNotificationCedule(
                      years,
                      int.parse(months),
                      int.parse(days),
                      int.parse(hours),
                      int.parse(minutes),
                    ),
                    child: const Text(
                        'Lancer une notification à un moment précis'),
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

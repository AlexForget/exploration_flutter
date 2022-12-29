import 'package:flutter/material.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';
import 'package:premier_test/services/local_notifications_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../Widget/drawerApp.dart';

class NotificationThematique extends StatefulWidget {
  const NotificationThematique({super.key});

  @override
  State<NotificationThematique> createState() => _NotificationThematiqueState();
}

class _NotificationThematiqueState extends State<NotificationThematique> {
  late final LocalNotificationService notificationService;
  TimeOfDay time = const TimeOfDay(hour: 8, minute: 0);
  List<bool> journeeIsChecked = [false, false, false, false, false, false];

  @override
  void initState() {
    tz.initializeTimeZones();
    notificationService = LocalNotificationService();
    notificationService.initialize();
    super.initState();
  }

  void journeeIsCheckedChanged(bool nouvelleValeur, int index) {
    setState(() {
      journeeIsChecked[index] = nouvelleValeur;
    });
  }

  void confirmerNotification(int heure, int minute) async {
    DateTime dernierDimanche(DateTime date) =>
        DateTime(date.year, date.month, date.day - date.weekday % 7);

    DateTime dimanche = dernierDimanche(DateTime.now());

    final local = tz.getLocation('America/Montreal');
    int notifId = 1;

    for (var i = 0; i < journeeIsChecked.length; i++) {
      if (journeeIsChecked[i]) {
        DateTime dateNotification = dimanche.add(Duration(days: i + 1));
        final notificationScheduled = tz.TZDateTime(
            local,
            dateNotification.year,
            dateNotification.month,
            dateNotification.day,
            heure,
            minute);

        notificationService.showNotificationScheduled(
            id: notifId++,
            title: 'Thématique'.hardcoded,
            body: 'Notification thématique $notificationScheduled'.hardcoded,
            scheduledDate: notificationScheduled,
            channelId: '3',
            channelName: 'thématiques'.hardcoded);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final heures = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    const fontSizePetit = 20.0;
    const fontSizeGrand = 28.0;
    const List<int> journeeIndex = [0, 1, 2, 3, 4, 5];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification thématique'.hardcoded),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Heure de la notification'.hardcoded,
                style: const TextStyle(fontSize: fontSizeGrand),
              ),
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
                  style: const TextStyle(fontSize: fontSizePetit),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'lundi'.hardcoded,
                          style: const TextStyle(fontSize: fontSizePetit),
                        ),
                      ),
                      Checkbox(
                        value: journeeIsChecked[0],
                        onChanged: (bool? nouvelleValeur) =>
                            journeeIsCheckedChanged(
                                nouvelleValeur!, journeeIndex[0]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'mardi'.hardcoded,
                        style: const TextStyle(fontSize: fontSizePetit),
                      )),
                      Checkbox(
                          value: journeeIsChecked[1],
                          onChanged: (bool? nouvelleValeur) =>
                              journeeIsCheckedChanged(
                                  nouvelleValeur!, journeeIndex[1])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'mercredi'.hardcoded,
                        style: const TextStyle(fontSize: fontSizePetit),
                      )),
                      Checkbox(
                          value: journeeIsChecked[2],
                          onChanged: (bool? nouvelleValeur) =>
                              journeeIsCheckedChanged(
                                  nouvelleValeur!, journeeIndex[2])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'jeudi'.hardcoded,
                        style: const TextStyle(fontSize: fontSizePetit),
                      )),
                      Checkbox(
                          value: journeeIsChecked[3],
                          onChanged: (bool? nouvelleValeur) =>
                              journeeIsCheckedChanged(
                                  nouvelleValeur!, journeeIndex[3])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'vendredi'.hardcoded,
                        style: const TextStyle(fontSize: fontSizePetit),
                      )),
                      Checkbox(
                          value: journeeIsChecked[4],
                          onChanged: (bool? nouvelleValeur) =>
                              journeeIsCheckedChanged(
                                  nouvelleValeur!, journeeIndex[4])),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'samedi'.hardcoded,
                        style: const TextStyle(fontSize: fontSizePetit),
                      )),
                      Checkbox(
                          value: journeeIsChecked[5],
                          onChanged: (bool? nouvelleValeur) =>
                              journeeIsCheckedChanged(
                                  nouvelleValeur!, journeeIndex[5])),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => confirmerNotification(
                    int.parse(heures), int.parse(minutes)),
                child: Text(
                  'Confirmer la notification'.hardcoded,
                  style: const TextStyle(fontSize: fontSizePetit),
                ),
              ),
              Text('$journeeIsChecked'),
            ],
          ),
        ),
      ),
    );
  }
}

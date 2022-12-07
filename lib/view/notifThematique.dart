import 'package:flutter/material.dart';
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
  bool? lundiIsCheck = false;
  bool? mardiIsCheck = false;
  bool? mercrediIsCheck = false;
  bool? jeudiIsCheck = false;
  bool? vendrediIsCheck = false;
  bool? samediIsCheck = false;

  @override
  void initState() {
    tz.initializeTimeZones();
    notificationService = LocalNotificationService();
    notificationService.initialize();
    super.initState();
  }

  void confirmerNotification(
      int annee, int mois, int jour, int heure, int minute) async {
    final local = tz.getLocation('America/Montreal');
    final notificationScheduled =
        tz.TZDateTime(local, annee, mois, jour, heure, minute);

    notificationService.showNotificationScheduled(
        id: 2,
        title: 'Thématique',
        body: 'Notification thématique',
        scheduledDate: notificationScheduled,
        channelId: '3',
        channelName: 'thématiques');
  }

  void lundiIsCheckChanged(bool? nouvelleValeur) {
    setState(() {
      lundiIsCheck = nouvelleValeur;
    });
  }

  void mardiIsCheckChanged(bool? nouvelleValeur) {
    setState(() {
      mardiIsCheck = nouvelleValeur;
    });
  }

  void mercrediIsCheckChanged(bool? nouvelleValeur) {
    setState(() {
      mercrediIsCheck = nouvelleValeur;
    });
  }

  void jeudiIsCheckChanged(bool? nouvelleValeur) {
    setState(() {
      jeudiIsCheck = nouvelleValeur;
    });
  }

  void vendrediIsCheckChanged(bool? nouvelleValeur) {
    setState(() {
      vendrediIsCheck = nouvelleValeur;
    });
  }

  void samediIsCheckChanged(bool? nouvelleValeur) {
    setState(() {
      samediIsCheck = nouvelleValeur;
    });
  }

  @override
  Widget build(BuildContext context) {
    final heures = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    const fontSizePetit = 20.0;
    const fontSizeGrand = 28.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification thématique'),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Heure de la notification',
                style: TextStyle(fontSize: fontSizeGrand),
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
                  Center(
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            child: Text(
                          'lundi',
                          style: TextStyle(fontSize: fontSizePetit),
                        )),
                        Checkbox(
                          value: lundiIsCheck,
                          onChanged: lundiIsCheckChanged,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            child: Text(
                          'mardi',
                          style: TextStyle(fontSize: fontSizePetit),
                        )),
                        Checkbox(
                          value: mardiIsCheck,
                          onChanged: mardiIsCheckChanged,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            child: Text(
                          'mercredi',
                          style: TextStyle(fontSize: fontSizePetit),
                        )),
                        Checkbox(
                          value: mercrediIsCheck,
                          onChanged: mercrediIsCheckChanged,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            child: Text(
                          'jeudi',
                          style: TextStyle(fontSize: fontSizePetit),
                        )),
                        Checkbox(
                          value: jeudiIsCheck,
                          onChanged: jeudiIsCheckChanged,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            child: Text(
                          'vendredi',
                          style: TextStyle(fontSize: fontSizePetit),
                        )),
                        Checkbox(
                          value: vendrediIsCheck,
                          onChanged: vendrediIsCheckChanged,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                            child: Text(
                          'samedi',
                          style: TextStyle(fontSize: fontSizePetit),
                        )),
                        Checkbox(
                          value: samediIsCheck,
                          onChanged: samediIsCheckChanged,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => confirmerNotification(
                    2022, 12, 07, int.parse(heures), int.parse(minutes)),
                child: const Text(
                  'Confirmer la notification',
                  style: TextStyle(fontSize: fontSizePetit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

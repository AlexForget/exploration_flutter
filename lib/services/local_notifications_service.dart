// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:premier_test/globals.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings,
      // onDidReceiveBackgroundNotificationResponse: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails(
      String channelId, String channelName) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(threadIdentifier: channelName);

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String channelId,
    required String channelName,
  }) async {
    final details = await _notificationDetails(channelId, channelName);
    await _localNotificationService.show(id, title, body, details);
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required int seconds,
    required String channelId,
    required String channelName,
  }) async {
    final details = await _notificationDetails(channelId, channelName);
    await _localNotificationService.periodicallyShow(
        id, title, body, RepeatInterval.everyMinute, details,
        androidAllowWhileIdle: true);
  }

  Future<void> cancelNotification({required int notifId}) async {
    await _localNotificationService.cancel(notifId);
  }

  Future<void> showNotificationScheduled({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
    required String channelId,
    required String channelName,
  }) async {
    final details = await _notificationDetails(channelId, channelName);
    try {
      await _localNotificationService.zonedSchedule(
          id, title, body, scheduledDate, details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true);
    } on ArgumentError {
      const SnackBar snackBar = SnackBar(
        content: Text('Date non valide'),
      );
      snackbarKey.currentState?.showSnackBar(snackBar);
    }
  }

  Future<void> showNotificationWithPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
    required String channelId,
    required String channelName,
  }) async {
    final details = await _notificationDetails(channelId, channelName);
    await _localNotificationService.show(id, title, body, details,
        payload: payload);
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id: $id');
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
  }
}
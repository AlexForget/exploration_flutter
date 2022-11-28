// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Widget/drawerApp.dart';

class NotifTest extends StatelessWidget {
  const NotifTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      drawer: const DrawerApp(),
    );
  }
}

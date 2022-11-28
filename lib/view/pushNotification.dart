import 'package:flutter/material.dart';

import '../Widget/drawerApp.dart';

class PushNotification extends StatelessWidget {
  const PushNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push notification'),
      ),
      drawer: const DrawerApp(),
    );
  }
}

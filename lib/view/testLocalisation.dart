import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Widget/drawerApp.dart';

class TestLocalisation extends StatefulWidget {
  const TestLocalisation({super.key});

  @override
  State<TestLocalisation> createState() => _TestLocalisationState();
}

class _TestLocalisationState extends State<TestLocalisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localisation'),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}
